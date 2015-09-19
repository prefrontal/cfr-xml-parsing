#include "pugixml.hpp"

#include <iostream>

int main (int argc, char *argv[]) 
{
    pugi::xml_document doc;

    pugi::xml_parse_result result = doc.load_file ("cfr-example.xml");
    //std::cout << "Load result: " << result.description() << std::endl;
 
    // --- FRONT MATTER -------------------------------------------------------------
   
    pugi::xml_node frontMatter = doc.child("CFRDOC").child("FMTR");
    
    std::cout << frontMatter.child("TITLEPG").child_value("TITLENUM") << std::endl;
    std::cout << frontMatter.child("TITLEPG").child_value("SUBJECT") << std::endl;
    std::cout << frontMatter.child("TITLEPG").child_value("PARTS") << std::endl;

    std::cout << "--------------------------------------" << std::endl;

    // --- CHAPTERS -----------------------------------------------------------------
    
    pugi::xml_node subchapters = doc.child("CFRDOC").child("TITLE").child("CHAPTER");
    
    for (pugi::xml_node subchapter = subchapters.first_child(); subchapter; subchapter = subchapter.next_sibling())
    {
        std::cout << subchapter.child_value("HD") << std::endl;
        
        for (pugi::xml_node part = subchapter.child("PART"); part; part = part.next_sibling())
            std::cout << part.child_value("HD") << std::endl;
            
        std::cout << std::endl;
    }

    // --- BACK MATTER --------------------------------------------------------------

    std::cout << "--------------------------------------" << std::endl;

    pugi::xml_node backMatter = doc.child("CFRDOC").child("BMTR");

}