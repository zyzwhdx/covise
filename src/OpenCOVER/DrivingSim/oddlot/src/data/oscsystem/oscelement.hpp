/* This file is part of COVISE.

   You can use it under the terms of the GNU Lesser General Public License
   version 2.1 or later, see lgpl-2.1.txt.

 * License: LGPL 2+ */

/**************************************************************************
** ODD: OpenDRIVE Designer
**   Frank Naegele (c) 2010
**   <mail@f-naegele.de>
**   02.02.2010
**
**************************************************************************/

#ifndef OSCELEMENT_HPP
#define OSCELEMENT_HPP

#include "src/data/dataelement.hpp"

#include "oscObjectBase.h"
#include "OpenScenarioBase.h"

using namespace OpenScenario;


class OSCBase;

class OSCElement : public DataElement, public OpenScenario::oscObjectBase
{

    //################//
    // STATIC         //
    //################//

public:
 /*   enum DRoadSystemElementType
    {
        DRE_None,
        DRE_Road,
        DRE_Controller,
        DRE_Junction,
        DRE_Fiddleyard,
        DRE_PedFiddleyard,
        DRE_Signal,
        DRE_Object
    };*/

    enum OSCElementChange
    {
        COE_IdChange = 0x1,
        COE_ParameterChange = 0x2,	// Name change is OpenScenario object name change 
    };

    //################//
    // FUNCTIONS      //
    //################//

public:
    explicit OSCElement(const QString &id, const OpenScenario::oscObjectBase *oscObjectBase = NULL);
    virtual ~OSCElement();

	const QString &getID() const
    {
        return id_;
    }

    void setID(const QString &id);

	// OSCBaseSystem //
    //
    OSCBase *getOSCBase() const
    {
        return oscBase_;
    }

    void setOSCBase(OSCBase *oscBase);

	const OpenScenario::oscObjectBase *getObject()
	{
		return oscObjectBase_;
	}

	void setObjectBase(const OpenScenario::oscObjectBase * oscObjectBase)
	{
		oscObjectBase_ = oscObjectBase;
	}

	// Visitor Pattern //
    //
    virtual void accept(Visitor *visitor);


    // Observer Pattern //
    //
    virtual void notificationDone();
    int getOSCElementChanges() const
    {
        return oscElementChanges_;
    }
    void addOSCElementChanges(int changes);

private:
    OSCElement(); /* not allowed */
    OSCElement(const OSCElement &); /* not allowed */
	OSCElement &operator=(const OSCElement &); /* not allowed */

    //################//
    // PROPERTIES     //
    //################//

private:
	// Base OSCElement //
	//
	OSCBase *oscBase_;

	const OpenScenario::oscObjectBase *oscObjectBase_;

	QString id_; // unique ID within ODDLOT database

    // Observer Pattern //
    //
    int oscElementChanges_;
};

#endif // OSCELEMENT_HPP