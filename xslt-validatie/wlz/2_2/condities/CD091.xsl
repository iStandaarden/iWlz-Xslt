<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_2/ca317/schema"
>

    <!-- iWlz 2.2 CD091 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD091"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD091"/>
    </xsl:template>

    <xsl:template match="ca317:GeleverdeZorg" mode="CD091">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="ca317:Leveringsvorm"/>
            <xsl:with-param name="pValue1">4,5,8,9</xsl:with-param>
            <xsl:with-param name="pOther" select="ca317:Instelling" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD091</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
