#include "Trajectory.h"

using namespace std;

Trajectory::Trajectory():
oscTrajectory()
{}
Trajectory::~Trajectory(){}

void Trajectory::finishedParsing()
{
}
void Trajectory::initialize(int verticesCounter_temp)
{
    verticesCounter = verticesCounter_temp;

}

osg::Vec3 Trajectory::getAbsolute(int visitedVertices, Entity *currentEntity){
    auto vert = Vertex[visitedVertices];

    if(vert->Position->World.exists()){
        osg::Vec3 absCoordinates (vert->Position->World->x.getValue(),vert->Position->World->y.getValue(),vert->Position->World->z.getValue());
        return absCoordinates;
    }
    else if(vert->Position->RelativeWorld.exists()){
        osg::Vec3 relCoordinates (vert->Position->RelativeWorld->dx.getValue(),vert->Position->RelativeWorld->dy.getValue(),vert->Position->RelativeWorld->dz.getValue());
        osg::Vec3 absCoordinates = relCoordinates + currentEntity->entityPosition;

        return absCoordinates;
    }

}

double Trajectory::getReference(int visitedVertices){
    /*
    wie soll die Refernce in der Trajecotry definiert werden?
    - für jeden Agenten wieder bei 0 starten?
    - einfach immer nur das dt in die Reference schreiben?
    */

    t1 = Vertex[visitedVertices]->Shape->reference.getValue();

    if(visitedVertices==verticesCounter){
        t0 = Vertex[visitedVertices-1]->Shape->reference.getValue();
    }
    else{
        t0 = Vertex[visitedVertices+1]->Shape->reference.getValue();
    }
    dt = t0-t1;

    dt = (float) dt;
    return dt;
}
