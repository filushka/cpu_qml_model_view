#ifndef CPUMODEL_H
#define CPUMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QModelIndex>
#include <QMetaType>
#include <QVariant>


class CpuObject
{

public:

    CpuObject( void ) { m_value = QString("null"); m_type = QString("null"); }
    CpuObject( const QString& type, const QString& value ) : m_type(type), m_value(value)
    {}


    QString type( void ) { return m_type; }
    QString value( void ) { return m_value; }


protected:
    QString m_type;
    QString m_value;
};


class CpuModel : public QAbstractListModel
{
    Q_OBJECT

    //Q_PROPERTY(QAbstractListModel *myModel READ model NOTIFY modelChanged)

public:

    enum CpuRoles {
        TypeRole = Qt::UserRole + 1,
        ValueRole
    };

    CpuModel( QObject *parent = 0 );

    void addCpuObject(const CpuObject &object);


     //index(), parent(), rowCount(), columnCount(), and data()
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

protected:
    QHash<int, QByteArray> roleNames() const;

    QList<CpuObject> m_modelList;

};

#endif // CPUMODEL_H

