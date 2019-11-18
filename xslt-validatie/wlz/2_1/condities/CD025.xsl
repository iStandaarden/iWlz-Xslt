<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">

    <!-- iWlz 2.1 CD025 version 1.9.7 (2019-10-01) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD025"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD025"/>
    </xsl:template>

    <xsl:template match="iwlz:LandCode" mode="CD025">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pValue1">NL</xsl:with-param>
            <xsl:with-param name="pOther" select="../iwlz:Huis/iwlz:Huisnummer"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD025</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
