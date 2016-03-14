/*
This program displays content of the /proc/cpuinfo file


Copyright (C) <2016>  <Sergey Tsybanov>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QtQml>

#include "fileio.h"

int main(int argc, char *argv[])
{
    //qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");

    QGuiApplication app(argc, argv);
    FileIO* file_io = new FileIO();
    file_io->setSource( "/proc/cpuinfo" );
    QStringList dataList = file_io->read();

    QQuickView view;
    QQmlContext* ctxt = view.rootContext();
    ctxt->setContextProperty("myModel", QVariant::fromValue(dataList));
    ctxt->setContextProperty( "myHeight", QVariant::fromValue( dataList.count() ) );
    //ctxt->setContextProperty( "listHeight", QVariant::fromValue( dataList.count()*1000 ) );
    view.setSource( QUrl::fromLocalFile("main.qml") );
    view.setMinimumSize( QSize( 1000, 1000 ) );
    view.show();
    return app.exec();

}


//Q_DECL_EXPORT int main(int argc, char *argv[])


