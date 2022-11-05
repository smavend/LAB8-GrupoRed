package com.example.lab8.Beans;

public class Hechizo {

    private int idHechizo;
    private String nombreHechizo;
    private int elementoRelacionado;
    private int potencia;
    private int precision;
    private int hechizoBase;
    private int nivelDeAprendizaje;

    public int getIdHechizo() {
        return idHechizo;
    }

    public void setIdHechizo(int idHechizo) {
        this.idHechizo = idHechizo;
    }

    public String getNombreHechizo() {
        return nombreHechizo;
    }

    public void setNombreHechizo(String nombreHechizo) {
        this.nombreHechizo = nombreHechizo;
    }

    public int getElementoRelacionado() {
        return elementoRelacionado;
    }

    public void setElementoRelacionado(int elementoRelacionado) {
        this.elementoRelacionado = elementoRelacionado;
    }

    public int getPotencia() {
        return potencia;
    }

    public void setPotencia(int potencia) {
        this.potencia = potencia;
    }

    public int getPrecision() {
        return precision;
    }

    public void setPrecision(int precision) {
        this.precision = precision;
    }

    public int getHechizoBase() {
        return hechizoBase;
    }

    public void setHechizoBase(int hechizoBase) {
        this.hechizoBase = hechizoBase;
    }

    public int getNivelDeAprendizaje() {
        return nivelDeAprendizaje;
    }

    public void setNivelDeAprendizaje(int nivelDeAprendizaje) {
        this.nivelDeAprendizaje = nivelDeAprendizaje;
    }
}
