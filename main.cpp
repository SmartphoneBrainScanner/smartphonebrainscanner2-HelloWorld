#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <mycallback.h>
#include <hardware/emotiv/sbs2emotivdatareader.h>
//#include <hardware/fake/sbs2fakedatareader.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // set path where recorded data will be stored
    qDebug() << "catalogPath: "<<Sbs2Common::setDefaultCatalogPath();
    // set path where application data is stored
    qDebug() << "rootAppPath: "<<Sbs2Common::setDefaultRootAppPath();

    MyCallback* myCallback = new MyCallback();
    //Sbs2FakeDataReader* sbs2DataReader = Sbs2FakeDataReader::New(myCallback,0);
    Sbs2EmotivDataReader* sbs2DataReader = Sbs2EmotivDataReader::New(myCallback,0);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    // Get access to the rectangle
    QObject *rootObject = engine.rootObjects().first();
    QObject *rect = rootObject->findChild<QObject*>("rect");

    //QObject *rect = engine.findChild<QObject*>();
    if (rect) {
        QObject::connect(myCallback,SIGNAL(timeTick8()),rect,SLOT(timeTick()));
        QObject::connect(myCallback,SIGNAL(valueSignal(QVariant)),rect,SLOT(channelValue(QVariant)));
        //QObject::connect(app.data(), SIGNAL(aboutToQuit()), sbs2DataReader, SLOT(aboutToQuit()));
        //QObject::connect((QObject*)rect, SIGNAL(quit()), app.data(), SLOT(quit()));
        qDebug() << "succes";
    } else {
        qDebug() << "fail";
    }

    return app.exec();
}
