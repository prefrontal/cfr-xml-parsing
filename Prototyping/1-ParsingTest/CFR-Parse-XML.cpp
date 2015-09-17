#include "pugixml.hpp"

#include <iostream>

int main (int argc, char *argv[]) 
{
    pugi::xml_document doc;

    pugi::xml_parse_result result = doc.load_file ("cfr.xml");
    
    std::cout << "Load result: " << result.description() << std::endl;
    
    pugi::xml_node subchapters = doc.child("CFRDOC").child("TITLE").child("CHAPTER");
    
    for (pugi::xml_node subchapter = subchapters.first_child(); subchapter; subchapter = subchapter.next_sibling())
    {
        std::cout << subchapter.child_value("HD") << std::endl;
        
        for (pugi::xml_node part = subchapter.child("PART"); part; part = part.next_sibling())
            std::cout << part.child_value("HD") << std::endl;
            
        std::cout << std::endl;
    }

    



    //        for (pugi::xml_attribute attr = subchapter.first_attribute(); attr; attr = attr.next_attribute())
    //        {
    //            std::cout << " " << attr.name() << "=" << attr.value();
    //        }


//    for (pugi::xml_node tool = tools.child("Tool"); tool; tool = tool.next_sibling("Tool"))
//    {
//        std::cout << "Tool " << tool.attribute("Filename").value();
//        std::cout << ": AllowRemote " << tool.attribute("AllowRemote").as_bool();
//        std::cout << ", Timeout " << tool.attribute("Timeout").as_int();
//        std::cout << ", Description '" << tool.child_value("Description") << "'\n";
//    }
//
//    std::cout << std::endl;
//
//    std::cout << "Tool for *.dae generation: " << tools.find_child_by_attribute("Tool", "OutputFileMasks", "*.dae").attribute("Filename").value() << "\n";
//
//    for (pugi::xml_node tool = tools.child("Tool"); tool; tool = tool.next_sibling("Tool"))
//    {
//        std::cout << "Tool " << tool.attribute("Filename").value() << "\n";
//    }

}