<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">
    <!-- iWlz 2.1 CD005 version 1.9.13 (2019-11-13) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD005"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD005"/>
    </xsl:template>

    <xsl:template match="iwlz:Postcode" mode="CD005">
        <xsl:call-template name="checkempty">
            <xsl:with-param name="pThis" select="."/>
            <xsl:with-param name="pOther" select="../iwlz:LandCode"/>
            <xsl:with-param name="pRule">CD005</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="iwlz:LandCode" mode="CD005">
        <xsl:call-template name="checkempty">
            <xsl:with-param name="pThis" select="."/>
            <xsl:with-param name="pOther" select="../iwlz:Postcode"/>
            <xsl:with-param name="pRule">CD005</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
