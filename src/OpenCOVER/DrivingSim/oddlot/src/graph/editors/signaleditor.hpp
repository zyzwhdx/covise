/* This file is part of COVISE.

   You can use it under the terms of the GNU Lesser General Public License
   version 2.1 or later, see lgpl-2.1.txt.

 * License: LGPL 2+ */

/**************************************************************************
** ODD: OpenDRIVE Designer
**   Frank Naegele (c) 2010
**   <mail@f-naegele.de>
**   15.03.2010
**
**************************************************************************/

#ifndef SIGNALEDITOR_HPP
#define SIGNALEDITOR_HPP

#include "projecteditor.hpp"

#include <QMultiMap>

class ProjectData;
class TopviewGraph;

class SignalRoadSystemItem;
class SignalHandle;
class SignalItem;
class ObjectItem;
class BridgeItem;
class Signal;
class SignalTreeWidget;
class RSystemElementRoad;
class SignalManager;
class Object;
class Bridge;

class SignalEditor : public ProjectEditor
{
    Q_OBJECT

    //################//
    // FUNCTIONS      //
    //################//

public:
    explicit SignalEditor(ProjectWidget *projectWidget, ProjectData *projectData, TopviewGraph *topviewGraph);
    virtual ~SignalEditor();

    // Tool, Mouse & Key //
    //
    virtual void mouseAction(MouseAction *mouseAction);

    // Handle //
    //
    SignalHandle *getInsertSignalHandle() const;

    // Tool //
    //
    virtual void toolAction(ToolAction *);

    // Move Signals //
    //
	void duplicate();
	void move(QPointF &diff);
    void translateSignal(SignalItem *signal, QPointF &diff);

	// New Signal with properties chosen in SignalTreeWidget //
	//
	Signal *addSignalToRoad(RSystemElementRoad *road, double s, double t);

	void translateObject(ObjectItem * objectItem, QPointF &diff);

	// New Object with properties chosen in SignalTreeWidget //
	//
	Object *addObjectToRoad(RSystemElementRoad *road, double s, double t);

	void translateBridge(BridgeItem * bridgeItem, QPointF &diff);

	void translate(QPointF &diff);

    // RoadType //
    //
    //	TypeSection::RoadType	getCurrentRoadType() const { return currentRoadType_; }
    //	void							setCurrentRoadType(TypeSection::RoadType roadType);

protected:
    virtual void init();
    virtual void kill();

private:
    SignalEditor(); /* not allowed */
    SignalEditor(const SignalEditor &); /* not allowed */
    SignalEditor &operator=(const SignalEditor &); /* not allowed */

    //################//
    // SLOTS          //
    //################//

public slots:
	// Parameter Settings //
	//
	virtual void apply() {};
	virtual void reject() {};
	virtual void reset() {};

    //################//
    // PROPERTIES     //
    //################//

private:
    // RoadSystem //
    //
    SignalRoadSystemItem *signalRoadSystemItem_;

    // Handle //
    //
    SignalHandle *insertSignalHandle_;

    // Selection of obscured items
    //
    SignalItem *lastSelectedSignalItem_;
    QMultiMap<double, SignalItem *> obscuredSignalItems_;
    ObjectItem *lastSelectedObjectItem_;
    QMultiMap<double, ObjectItem *> obscuredObjectItems_;
    BridgeItem *lastSelectedBridgeItem_;
    QMultiMap<double, BridgeItem *> obscuredBridgeItems_;

    ODD::ToolId lastTool_;


	// Signal Tree //
	//
	SignalTreeWidget *signalTree_;
	SignalManager *signalManager_;

    // RoadType //
    //
    //	TypeSection::RoadType	currentRoadType_;
};

#endif // ROADTYPEEDITOR_HPP
