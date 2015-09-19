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
void DisplaySection (pugi::xml_node section);

// Begin Implementation
int main (int argc, char *argv[]) 
{
    pugi::xml_document doc;

    pugi::xml_parse_result result = doc.load_file (FILENAME.c_str());
    //std::cout << "Load result: " << result.description() << std::endl;
 
    // --- FRONT MATTER -------------------------------------------------------------
   
    pugi::xml_node frontMatter = doc.child("CFRDOC").child("FMTR");
    
    std::cout << frontMatter.child("TITLEPG").child_value("TITLENUM") << std::endl;
    std::cout << frontMatter.child("TITLEPG").child_value("SUBJECT") << std::endl;
    std::cout << frontMatter.child("TITLEPG").child_value("PARTS") << std::endl;

    std::cout << "--------------------------------------" << std::endl;

    // --- CHAPTER ------------------------------------------------------------------
    
    pugi::xml_node chapter = doc.child("CFRDOC").child("TITLE").child("CHAPTER");
    
    DisplayChapter (chapter);

    // --- BACK MATTER --------------------------------------------------------------

    std::cout << "--------------------------------------" << std::endl;

    pugi::xml_node backMatter = doc.child("CFRDOC").child("BMTR");

}

void DisplayChapter (pugi::xml_node chapter)
{
    std::cout << chapter.child("TOC").child("TOCHD").child_value("HD") << std::endl;
    
    for (pugi::xml_node subchapter = chapter.first_child(); subchapter; subchapter = subchapter.next_sibling())
    {
        DisplaySubchapter (subchapter);
    }
}

void DisplaySubchapter (pugi::xml_node subchapter)
{
    std::cout << subchapter.child_value("HD") << std::endl;
    
    for (pugi::xml_node part = subchapter.child("PART"); part; part = part.next_sibling())
    {
        DisplayPart (part);
    }
}

void DisplayPart (pugi::xml_node part)
{
    std::cout << part.child_value("HD") << std::endl;
    
    // From here we can either go on to SECTIONs or SUBPARTs
    
    for (pugi::xml_node section = part.child("SECTION"); section; section = section.next_sibling())
    {
        DisplaySection (section);
    }
}

void DisplaySection (pugi::xml_node section)
{
    std::cout << section.child_value("SECTNO") << std::endl;
}