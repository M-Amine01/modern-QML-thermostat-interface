#pragma once
#include <QObject>


class Temperture : public QObject{
    Q_OBJECT
    Q_PROPERTY(int tempValue READ get_tempValue WRITE set_New_tempValue NOTIFY tempValue_Changed)
private:
    int tempValue =24;
public:
    explicit Temperture(QObject *parent = nullptr);
    Q_INVOKABLE void increase_Value();
    Q_INVOKABLE void decrease_Value();
    int get_tempValue() const;
    void set_New_tempValue(int newValue);

signals:
    void tempValue_Changed();
};
