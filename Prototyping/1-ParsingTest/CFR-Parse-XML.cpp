#include "pugixml.hpp"

#include <iostream>

namespace
{
    const std::string FILENAME = "cfr-example.xml";
}

// Forward Declarations
void DisplayChapter (pugi::xml_node chapter);
void DisplaySubchapter (pugi::xml_node subchapter);
void DisplayPart (pugi::xml_node part);
void DisplaySubpart (pugi::xml_node part);
void DisplaySubjectGroup (pugi::xml_node part);
void DisplaySection (pugi::xml_node section);

void OutputText (std::string text);

// Begin Implementation
int main (int argc, char *argv[]) 
{
    // Load the target XML file for processing
    // TODO: process load errors
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file (FILENAME.c_str());
 
    // --- FRONT MATTER -------------------------------------------------------------
   
    // There isn't much we want to display from the front matter
    // Instead of making things complex just process by absolute path
    
    pugi::xml_node frontMatter = doc.child("CFRDOC").child("FMTR");
    
    std::cout << frontMatter.child("TITLEPG").child_value("TITLENUM") << std::endl;
    std::cout << frontMatter.child("TITLEPG").child_value("SUBJECT") << std::endl;
    std::cout << frontMatter.child("TITLEPG").child_value("PARTS") << std::endl;

    std::cout << "--------------------------------------" << std::endl;

    // --- CHAPTER ------------------------------------------------------------------
    
    // Chapters are more complex and the hierarchy is not known ahead of time
    // We will dynamically process the chapter contents for display/saving
    
    // Display the chapter title
    pugi::xml_node chapter = doc.child("CFRDOC").child("TITLE").child("CHAPTER");
    
    // Process the chapter data
    DisplayChapter (chapter);

    // --- BACK MATTER --------------------------------------------------------------

    // There really isn't anything we want to display in the back matter
    // This is just stubbed out in case we want to use it in the future

    std::cout << "--------------------------------------" << std::endl;

    pugi::xml_node backMatter = doc.child("CFRDOC").child("BMTR");

}

void DisplayChapter (pugi::xml_node chapter)
{
    // Display chapter title
    std::cout << chapter.child("TOC").child("TOCHD").child_value("HD") << std::endl;
    
    // Process CHAPTER contents
    // Really, the only nodes we are interested in are SUBCHAPs
    for (pugi::xml_node aNode = chapter.first_child(); aNode; aNode = aNode.next_sibling())
    {
        if (!strcmp(aNode.name(), "SUBCHAP"))
            DisplaySubchapter (aNode);
    }
}

void DisplaySubchapter (pugi::xml_node subchapter)
{
    // Display subchapter title
    std::cout << std::endl << subchapter.child_value("HD") << std::endl;
    
    // Process SUBCHAP contents
    // Really, the only nodes we are interested in are PARTs
    for (pugi::xml_node aNode = subchapter.first_child(); aNode; aNode = aNode.next_sibling())
    {
        if (!strcmp(aNode.name(), "PART"))
            DisplayPart (aNode);
    }
}

void DisplayPart (pugi::xml_node part)
{
    // Display part title
    std::cout << std::endl << part.child_value("HD") << std::endl;
    
    // Process PART contents
    // From here we can either go on to SECTIONs or SUBPARTs
    for (pugi::xml_node aNode = part.first_child(); aNode; aNode = aNode.next_sibling())
    {
        // Ignore EAR, HD, CONTENTS, AUTH, SOURCE, EDNOTE, APPENDIX
            
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
    // Display subpart title
    // Some subparts are reserved and have no title, so make sure to check
    if (strcmp(subpart.child_value("HD"), ""))
        std::cout << std::endl << subpart.child_value("HD") << std::endl;
    
    // Process SUBPART contents
    // From here we can either go on to SECTIONs or SUBJGRPs
    for (pugi::xml_node aNode = subpart.first_child(); aNode; aNode = aNode.next_sibling())
    {
        // Ignore PRTPAGE, APPENDIX
            
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
    // Display subjectGroup title
    std::cout << subjectGroup.child_value("HD") << std::endl;
    
    // Not sure what SUBJGRPs are really for at this point,
    // but they do have SECTIONs, so let's at least process those
    for (pugi::xml_node aNode = subjectGroup.first_child(); aNode; aNode = aNode.next_sibling())
    {            
        // Section
        if (!strcmp(aNode.name(), "SECTION"))
            DisplaySection (aNode);
    }
}

void DisplaySection (pugi::xml_node section)
{
    // Display both the section number and the section title
    std::cout << section.child_value("SECTNO") << " - " << section.child_value("SUBJECT") << std::endl;
    
    // Process SECTION contents
    // These are typically the actual rgulations
    for (pugi::xml_node aNode = section.first_child(); aNode; aNode = aNode.next_sibling())
    {            
        if (!strcmp(aNode.name(), "P"))
        {
            OutputText (aNode.child_value());
        }
    }
}


// Helper method to display text in the console and save to a file
void OutputText (std::string text)
{
    std::cout << text << std::endl;
}