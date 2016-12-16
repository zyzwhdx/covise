/* This file is part of COVISE.

You can use it under the terms of the GNU Lesser General Public License
version 2.1 or later, see lgpl - 2.1.txt.

* License: LGPL 2 + */


#ifndef OSCOPENSCENARIO_PEDESTRIANCATALOG_H
#define OSCOPENSCENARIO_PEDESTRIANCATALOG_H

#include "oscExport.h"
#include "oscObjectBase.h"
#include "oscObjectVariable.h"
#include "oscObjectVariableArray.h"

#include "oscVariables.h"
#include "schema/oscFileHeader.h"
#include "schema/oscPedestrian.h"

namespace OpenScenario
{
class OPENSCENARIOEXPORT oscOpenSCENARIO_PedestrianCatalog : public oscObjectBase
{
public:
oscOpenSCENARIO_PedestrianCatalog()
{
        OSC_OBJECT_ADD_MEMBER(FileHeader, "oscFileHeader");
        OSC_OBJECT_ADD_MEMBER(Pedestrian, "oscPedestrian");
    };
    oscFileHeaderMember FileHeader;
    oscPedestrianArrayMember Pedestrian;

};

typedef oscObjectVariable<oscOpenSCENARIO_PedestrianCatalog *> oscOpenSCENARIO_PedestrianCatalogMember;
typedef oscObjectVariableArray<oscOpenSCENARIO_PedestrianCatalog *> oscOpenSCENARIO_PedestrianCatalogArrayMember;


}

#endif //OSCOPENSCENARIO_PEDESTRIANCATALOG_H