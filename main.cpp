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


