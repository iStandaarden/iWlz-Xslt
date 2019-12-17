<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ca319="http://www.istandaarden.nl/iwlz/2_1/ca319/schema"
>

    <!-- iWlz 2.1 CS067 version 1.9.12 (2019-10-22) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS067"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS067"/>
    </xsl:template>

    <xsl:template match="ca319:MutatieZorg/ca319:Mutatiecode" mode="CS067">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">19,20</xsl:with-param>
            <xsl:with-param name="pRule">CS067</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
