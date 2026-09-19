#include "temperture.h"

Temperture::Temperture(QObject *parent) : QObject(parent){}


void Temperture::increase_Value(){
    tempValue ++;
    if (tempValue > 40){
        tempValue =40;
    }
    emit tempValue_Changed();
}


void Temperture::decrease_Value(){
    tempValue--;
    if (tempValue < -9){
        tempValue = -9;
    }
    emit tempValue_Changed();
}


int Temperture::get_tempValue() const{
    return tempValue;
}


void Temperture::set_New_tempValue(int newValue){
    if (newValue == tempValue){
        return ;
    }
    tempValue = newValue;
    emit tempValue_Changed();
}
