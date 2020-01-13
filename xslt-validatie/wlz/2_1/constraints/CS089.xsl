<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">
    <!-- iWlz 2.1 CS089 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS089"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS089"/>
    </xsl:template>

    <xsl:template match="iwlz:LandCode" mode="CS089">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pValue1">NL</xsl:with-param>
            <xsl:with-param name="pOther" select="../iwlz:Postcode"/>
            <xsl:with-param name="pValue2">#1000ZZ</xsl:with-param>
            <xsl:with-param name="pRule">CS089</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
