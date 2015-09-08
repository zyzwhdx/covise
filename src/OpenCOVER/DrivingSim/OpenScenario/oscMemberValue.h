/* This file is part of COVISE.

You can use it under the terms of the GNU Lesser General Public License
version 2.1 or later, see lgpl-2.1.txt.

* License: LGPL 2+ */
#ifndef OSC_MEMBER_VALUE_H
#define OSC_MEMBER_VALUE_H

#include <oscExport.h>
#include <xercesc/util/XercesDefs.hpp>
XERCES_CPP_NAMESPACE_BEGIN
class DOMAttr;
class DOMElement;
class DOMDocument;
XERCES_CPP_NAMESPACE_END

namespace OpenScenario {

/// \class This class represents a member variable value in an oscObject
class OPENSCENARIOEXPORT oscMemberValue 
{
public:
    enum MemberTypes
    {
        UINT = 0,
        INT = 1,
        USHORT = 2,
        SHORT = 3,
        STRING = 4,
        DOUBLE = 5,
        OBJECT = 6,
        DATE_TIME = 7,
    };
protected:
    enum MemberTypes type;
public:
    oscMemberValue(); ///< constructor
    virtual ~oscMemberValue(); ///< destructor
    MemberTypes getType(); ///< return the type of this value
    virtual bool initialize(xercesc::DOMAttr *);
    virtual bool writeToDOM(xercesc::DOMElement *currentElement, xercesc::DOMDocument *document, const char *name)=0;
};

}

#endif //OSC_MEMBER_VALUE_H