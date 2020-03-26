<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema">
    <!-- iWlz 2.1 CD048 version 1.9.19 (2020-03-25) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD048"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD048"/>
    </xsl:template>

    <xsl:template match="aw39:BijzondereSituatie" mode="CD048">
        <xsl:choose>
            <xsl:when test="concat(normalize-space(./iwlz:ExtraKostenThuis/text()), normalize-space(./iwlz:ToeslagBeademing/text())) = '' or
                            not(./iwlz:ExtraKostenThuis) and not(./iwlz:ToeslagBeademing)">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pValue1">#</xsl:with-param>
                    <xsl:with-param name="pOther" select="./iwlz:ToeslagOverig"/>
                    <xsl:with-param name="pValue2">*</xsl:with-param>
                    <xsl:with-param name="pRule">CD048</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="checkvalue">
                    <xsl:with-param name="pThis" select="./iwlz:ToeslagOverig"/>
                    <xsl:with-param name="pValues"/>
                    <xsl:with-param name="pRule">CD048</xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="zk39:BijzondereSituatie" mode="CD048">
        <xsl:choose>
            <xsl:when test="concat(normalize-space(./iwlz:ExtraKostenThuis/text()), normalize-space(./iwlz:ToeslagBeademing/text())) = '' or
                            not(./iwlz:ExtraKostenThuis) and not(./iwlz:ToeslagBeademing)">
                <xsl:call-template name="checkimplication">
                    <xsl:with-param name="pValue1">#</xsl:with-param>
                    <xsl:with-param name="pOther" select="./iwlz:ToeslagOverig"/>
                    <xsl:with-param name="pValue2">*</xsl:with-param>
                    <xsl:with-param name="pRule">CD048</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="checkvalue">
                    <xsl:with-param name="pThis" select="./iwlz:ToeslagOverig"/>
                    <xsl:with-param name="pValues"/>
                    <xsl:with-param name="pRule">CD048</xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
