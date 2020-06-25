<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>
    <!-- iwlz 2.1 TR002 version 2.1.1 (2020-06-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR002"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR002"/>
    </xsl:template>

    <xsl:template match="*[local-name() = 'Geboortedatum']/iwlz:Datum" mode="TR002">
        <xsl:variable name="parent" select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']"/>
        <xsl:if test="text() != '1900-01-01' or ../iwlz:DatumGebruik/text() != '3'">
	        <xsl:choose>
	            <xsl:when test="$parent/*[local-name() = 'BerichtIdentificatie']/*[local-name() = 'Dagtekening']">
	                <xsl:call-template name="checkYearsBetween">
	                    <xsl:with-param name="pDate1"
	                                    select="$parent/*[local-name() = 'BerichtIdentificatie']/*[local-name() = 'Dagtekening']"/>
	                    <xsl:with-param name="pDate2" select="."/>
	                    <xsl:with-param name="pYears">120</xsl:with-param>
	                    <xsl:with-param name="pRule">
	                        TR002
	                    </xsl:with-param>
	                </xsl:call-template>
	            </xsl:when>
	            <xsl:otherwise>
	                <xsl:call-template name="checkYearsBetween">
	                    <xsl:with-param name="pDate1"
	                                    select="$parent/*[local-name() = 'DeclaratieFactuurIdentificatie']/*[local-name() = 'FactuurDagtekening']"/>
	                    <xsl:with-param name="pDate2" select="."/>
	                    <xsl:with-param name="pYears">120</xsl:with-param>
	                    <xsl:with-param name="pRule">
	                        TR002
	                    </xsl:with-param>
	                </xsl:call-template>
	            </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
