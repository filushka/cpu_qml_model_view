#include "cpumodel.h"
#include "fileio.h"

#include <QString>
#include <QHash>
#include <QStringList>
#include <QApplication>
#include <QPalette>
#include <QDebug>

CpuModel::CpuModel(QObject *parent )
{
    FileIO* file_io = new FileIO();
    file_io->setSource( "/proc/cpuinfo" );
    QStringList dataList = file_io->read();

    for( int i = 0; i < dataList.count(); i++)
    {
        QStringList tmp = dataList.at(i).split( QRegExp("\t:") );
        if( tmp.size() > 1 )
            addCpuObject( CpuObject( tmp.at(0), tmp.at(1) ) );
        else
            addCpuObject( CpuObject( tmp.at(0), QString() ) );

    }
}


void CpuModel::addCpuObject(const CpuObject &cpuObject)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_modelList << cpuObject;
    endInsertRows();
}


int CpuModel::rowCount(const QModelIndex &index) const
{
    Q_UNUSED( index )
    return m_modelList.count();
}



QVariant CpuModel::data(const QModelIndex &index, int role ) const
{
    if (index.row() < 0 || index.row() >= m_modelList.count())
        return QVariant();

    CpuObject cpuObjects = m_modelList[index.row()];
    if (role == TypeRole)
        return cpuObjects.type();
    else if (role == ValueRole)
        return cpuObjects.value();

    return QVariant();
}

QHash<int, QByteArray> CpuModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[TypeRole] = "type";
    roles[ValueRole] = "value";
    return roles;
}
