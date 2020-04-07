<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
>
    <!-- iwlz 2.1 TR010 version 1.9.20 (2020-04-06) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR010"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR010"/>
    </xsl:template>

    <xsl:template match="*[aw33:Opslag and aw33:Klasse] | aw33:ToegewezenFunctie | aw33:GeindiceerdeFunctie"
                  mode="TR010">
        <xsl:call-template name="checkOpslagAndKlasse">
            <xsl:with-param name="pOpslag" select="aw33:Opslag"/>
            <xsl:with-param name="pKlasse" select="aw33:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[zk31:Opslag and zk31:Klasse] | zk31:GeindiceerdeFunctie | zk31:ToegewezenFunctie"
                  mode="TR010">
        <xsl:call-template name="checkOpslagAndKlasse">
            <xsl:with-param name="pOpslag" select="zk31:Opslag"/>
            <xsl:with-param name="pKlasse" select="zk31:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[zk33:Opslag and zk33:Klasse] | zk33:GeindiceerdeFunctie | zk33:ToegewezenFunctie"
                  mode="TR010">
        <xsl:call-template name="checkOpslagAndKlasse">
            <xsl:with-param name="pOpslag" select="zk33:Opslag"/>
            <xsl:with-param name="pKlasse" select="zk33:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[zk35:Opslag and zk35:Klasse] | zk35:GeleverdeFunctie" mode="TR010">
        <xsl:call-template name="checkOpslagAndKlasse">
            <xsl:with-param name="pOpslag" select="zk35:Opslag"/>
            <xsl:with-param name="pKlasse" select="zk35:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[aw35:Opslag and aw35:Klasse] | aw35:GeleverdeFunctie" mode="TR010">
        <xsl:call-template name="checkOpslagAndKlasse">
            <xsl:with-param name="pOpslag" select="aw35:Opslag"/>
            <xsl:with-param name="pKlasse" select="aw35:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[io31:Opslag and io31:Klasse] | io31:GeindiceerdeFunctie" mode="TR010">
        <xsl:call-template name="checkOpslagAndKlasse">
            <xsl:with-param name="pOpslag" select="io31:Opslag"/>
            <xsl:with-param name="pKlasse" select="io31:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="checkOpslagAndKlasse">
        <xsl:param name="pOpslag"/>
        <xsl:param name="pKlasse"/>
        <xsl:param name="pFunctie" select="./*[local-name() = 'FunctieCode']"/>

        <xsl:choose>
            <xsl:when test="$pFunctie = '21'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!K8</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pFunctie = '31'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!K8</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pFunctie = '41'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!K7</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pFunctie = '64'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!KD09</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pFunctie = '71'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!KE7</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pFunctie = '81'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!K8</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pFunctie = '82'">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">!KD09</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pKlasse"/>
                    <xsl:with-param name="pValue1">99</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pOpslag"/>
                    <xsl:with-param name="pValue2"/>
                    <xsl:with-param name="pRule">TR010</xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
