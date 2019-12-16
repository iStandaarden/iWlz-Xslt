<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
                >
    <!-- iWlz 2.1 CS058 version 1.9.11 (2019-10-11) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS058"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS058"/>
    </xsl:template>

    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw35:GeleverdeFunctie/aw35:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdeFunctie/zk35:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:MutatieZorgzwaartepakket/aw39:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:MutatieFunctie/aw39:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk39:MutatieZorgzwaartepakket/zk39:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk39:MutatieFunctie/zk39:StatusAanlevering" mode="CS058">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">
                1,3
            </xsl:with-param>
            <xsl:with-param name="pRule">
                CS058
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
