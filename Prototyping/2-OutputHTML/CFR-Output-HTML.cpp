#include "pugixml.hpp"

#include <fstream>
#include <iostream>
#include <sstream>

namespace
{
    const std::string FILENAME = "cfr-example.xml";
    
    // Cheating a bit by putting this in the anonymous namespace
    std::ofstream outputStream;
    const std::string OUTPUT_FILENAME = "cfr-output.txt";
}

// Forward Declarations
void DisplayFrontMatter (pugi::xml_node chapter);
void DisplayChapter (pugi::xml_node chapter);
void DisplayBackMatter (pugi::xml_node chapter);

void DisplaySubchapter (pugi::xml_node subchapter);
void DisplayPart (pugi::xml_node part);
void DisplaySubpart (pugi::xml_node part);
void DisplaySubjectGroup (pugi::xml_node part);
void DisplaySection (pugi::xml_node section);

void OutputText (std::string text);

// ------------------------------------------------------------------------------

// Begin Implementation
int main (int argc, char *argv[]) 
{
    outputStream.open (OUTPUT_FILENAME);
    
    // Load the target XML file for processing
    // TODO: process load errors
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file (FILENAME.c_str());
 
    // --- FRONT MATTER -------------------------------------------------------------
   
    // There isn't much we want to display from the front matter
    // Instead of making things complex just process by absolute path
    
    pugi::xml_node frontMatter = doc.child("CFRDOC").child("FMTR");
    DisplayFrontMatter (frontMatter);

    // --- CHAPTER ------------------------------------------------------------------
    
    // Chapters are more complex and the hierarchy is not known ahead of time
    // We will dynamically process the chapter contents for display/saving
    
    pugi::xml_node chapter = doc.child("CFRDOC").child("TITLE").child("CHAPTER");
    DisplayChapter (chapter);

    // --- BACK MATTER --------------------------------------------------------------

    // There really isn't anything we want to display in the back matter
    // This is just stubbed out in case we want to use it in the future

    pugi::xml_node backMatter = doc.child("CFRDOC").child("BMTR");
    DisplayBackMatter (backMatter);

    // ------------------------------------------------------------------------------

    outputStream.close();
    
}

void DisplayFrontMatter (pugi::xml_node frontMatter)
{
    OutputText (frontMatter.child("TITLEPG").child_value("TITLENUM"));
    OutputText (frontMatter.child("TITLEPG").child_value("SUBJECT"));
    OutputText (frontMatter.child("TITLEPG").child_value("PARTS")); 
    
    OutputText ("--------------------------------------");
}

void DisplayChapter (pugi::xml_node chapter)
{
    // Display chapter title
    OutputText (chapter.child("TOC").child("TOCHD").child_value("HD"));
    
    // Process CHAPTER contents
    // Really, the only nodes we are interested in are SUBCHAPs
    for (pugi::xml_node aNode = chapter.first_child(); aNode; aNode = aNode.next_sibling())
    {
        if (!strcmp(aNode.name(), "SUBCHAP"))
            DisplaySubchapter (aNode);
    }
}

void DisplayBackMatter (pugi::xml_node backMatter)
{
    OutputText ("--------------------------------------");
    // Does nothing for now - just a stub for future development
}

void DisplaySubchapter (pugi::xml_node subchapter)
{
    // Process SUBCHAP contents
    // Really, the only nodes we are interested in are PARTs
    for (pugi::xml_node aNode = subchapter.first_child(); aNode; aNode = aNode.next_sibling())
    {
        // Title
        if (!strcmp(aNode.name(), "HD"))
            OutputText (aNode.child_value("HD"));
        
        // Part
        if (!strcmp(aNode.name(), "PART"))
            DisplayPart (aNode);
    }
}

void DisplayPart (pugi::xml_node part)
{
    // Process PART contents
    // From here we can either go on to SECTIONs or SUBPARTs
    for (pugi::xml_node aNode = part.first_child(); aNode; aNode = aNode.next_sibling())
    {
        // Ignore EAR, HD, CONTENTS, AUTH, SOURCE, EDNOTE, APPENDIX
            
        // Title
        if (!strcmp(aNode.name(), "HD"))
            OutputText (aNode.child_value("HD"));
            
        // Subpart
        if (!strcmp(aNode.name(), "SUBPART"))
            DisplaySubpart (aNode);
            
        // Section
        if (!strcmp(aNode.name(), "SECTION"))
            DisplaySection (aNode);
    }
}

void DisplaySubpart (pugi::xml_node subpart)
{
    // Process SUBPART contents
    // From here we can either go on to SECTIONs or SUBJGRPs
    for (pugi::xml_node aNode = subpart.first_child(); aNode; aNode = aNode.next_sibling())
    {
        // Ignore PRTPAGE, APPENDIX
            
        // Title
        if (!strcmp(aNode.name(), "HD"))
            OutputText (aNode.child_value("HD"));
            
        // Subject Group
        if (!strcmp(aNode.name(), "SUBJGRP"))
            DisplaySubjectGroup (aNode);
            
        // Section
        if (!strcmp(aNode.name(), "SECTION"))
            DisplaySection (aNode);
    }
}

void DisplaySubjectGroup (pugi::xml_node subjectGroup)
{
    // Not sure what SUBJGRPs are really for at this point,
    // but they do have SECTIONs, so let's at least process those
    for (pugi::xml_node aNode = subjectGroup.first_child(); aNode; aNode = aNode.next_sibling())
    {           
        // Title
        if (!strcmp(aNode.name(), "HD"))
            OutputText (aNode.child_value("HD"));
         
        // Section
        if (!strcmp(aNode.name(), "SECTION"))
            DisplaySection (aNode);
    }
}

void DisplaySection (pugi::xml_node section)
{
    // Display both the section number and the section title
    std::string temp = std::string(section.child_value("SECTNO")) + std::string(" - ") + std::string(section.child_value("SUBJECT"));
    OutputText (temp);
    
    // Process SECTION contents
    // These are typically the actual regulations
    for (pugi::xml_node aNode = section.first_child(); aNode; aNode = aNode.next_sibling())
    {            
        // The paragraph tags are funny because they can have subelements that are less XML nodes
        // and more like HTML tags, primarily for emphasis or formatting.  We build a stringstream
        // here with all the components of the paragraph and then output that text
        if (!strcmp(aNode.name(), "P"))
        {
            std::stringstream tempStream;
            
            for (pugi::xml_node bNode = aNode.first_child(); bNode; bNode = bNode.next_sibling())
            {   
                tempStream << bNode.child_value();
            }
            
            tempStream << aNode.child_value();
            OutputText (tempStream.str());
        }
    }
}


// Helper method to display text in the console and save to a file
void OutputText (std::string text)
{
    std::cout << std::endl << text << std::endl;
    outputStream << std::endl << text << std::endl;
}