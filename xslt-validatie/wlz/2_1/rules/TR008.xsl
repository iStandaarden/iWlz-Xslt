<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
>
    <!-- iwlz 2.1 TR008 version 1.9.13 (2019-11-13) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR008"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR008"/>
    </xsl:template>

    <xsl:template match="*[aw33:FunctieCode]" mode="TR008">
        <xsl:call-template name="checkFunctieList">
            <xsl:with-param name="pFunctieCode" select="aw33:FunctieCode"/>
            <xsl:with-param name="pKlasse" select="aw33:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[zk31:FunctieCode]" mode="TR008">
        <xsl:call-template name="checkFunctieList">
            <xsl:with-param name="pFunctieCode" select="zk31:FunctieCode"/>
            <xsl:with-param name="pKlasse" select="zk31:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[zk33:FunctieCode]" mode="TR008">
        <xsl:call-template name="checkFunctieList">
            <xsl:with-param name="pFunctieCode" select="zk33:FunctieCode"/>
            <xsl:with-param name="pKlasse" select="zk33:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[zk35:FunctieCode]" mode="TR008">
        <xsl:call-template name="checkFunctieList">
            <xsl:with-param name="pFunctieCode" select="zk35:FunctieCode"/>
            <xsl:with-param name="pKlasse" select="zk35:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[aw35:FunctieCode]" mode="TR008">
        <xsl:call-template name="checkFunctieList">
            <xsl:with-param name="pFunctieCode" select="aw35:FunctieCode"/>
            <xsl:with-param name="pKlasse" select="aw35:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="*[io31:FunctieCode]" mode="TR008">
        <xsl:call-template name="checkFunctieList">
            <xsl:with-param name="pFunctieCode" select="io31:FunctieCode"/>
            <xsl:with-param name="pKlasse" select="io31:Klasse"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="checkFunctieList">
        <xsl:param name="pFunctieCode"/>
        <xsl:param name="pKlasse"/>

        <xsl:choose>
            <xsl:when test="$pKlasse">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pFunctieCode"/>
                    <xsl:with-param name="pValue1">21,31,81</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pKlasse"/>
                    <xsl:with-param name="pValue2">K1,K2,K3,K4,K5,K6,K7,K8</xsl:with-param>
                    <xsl:with-param name="pRule">TR008</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pFunctieCode"/>
                    <xsl:with-param name="pValue1">41</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pKlasse"/>
                    <xsl:with-param name="pValue2">K0,K1,K2,K3,K4,K5,K6,K7</xsl:with-param>
                    <xsl:with-param name="pRule">TR008</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pFunctieCode"/>
                    <xsl:with-param name="pValue1">61,62,63,91</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pKlasse"/>
                    <xsl:with-param name="pValue2">99</xsl:with-param>
                    <xsl:with-param name="pRule">TR008</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pFunctieCode"/>
                    <xsl:with-param name="pValue1">64,82</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pKlasse"/>
                    <xsl:with-param name="pValue2">KD01,KD02,KD03,KD04,KD05,KD06,KD07,KD08,KD09</xsl:with-param>
                    <xsl:with-param name="pRule">TR008</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pThis" select="$pFunctieCode"/>
                    <xsl:with-param name="pValue1">71</xsl:with-param>
                    <xsl:with-param name="pOther" select="$pKlasse"/>
                    <xsl:with-param name="pValue2">KE1,KE2,KE3,KE4,KE5,KE6,KE7</xsl:with-param>
                    <xsl:with-param name="pRule">TR008</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
