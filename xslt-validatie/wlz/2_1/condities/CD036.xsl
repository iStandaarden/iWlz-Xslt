<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema">
    
    <!-- iWlz 2.1 CD036 version 1.8.5 (2019-08-28) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD036"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD036"/>
    </xsl:template>

    <xsl:template match="aw317:Postcode" mode="CD036">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="../aw317:LandCode"/>
            <xsl:with-param name="pValue2">NL</xsl:with-param>
            <xsl:with-param name="pRule">CD036</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
