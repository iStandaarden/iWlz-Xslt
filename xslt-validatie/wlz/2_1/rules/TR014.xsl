<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR014 version 1.9.14 (2019-12-02) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR014"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR014"/>
    </xsl:template>

    <xsl:template match="aw33:Indicatie[*/aw33:ToegewezenFunctie | */aw33:GeindiceerdZorgzwaartepakket | */aw33:ToegewezenZorgzwaartepakket]" mode="TR014">
        <xsl:choose>
            <xsl:when test="aw33:Einddatum">
            	<xsl:choose>
            		<xsl:when test="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Einddatum) != 
            			count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*)">
            			<xsl:call-template name="addError">
                        	<xsl:with-param name="pElements" select="aw33:Einddatum"/>
                        	<xsl:with-param name="pRule">
                            	TR014
                        	</xsl:with-param>
                    	</xsl:call-template>
            		</xsl:when>
            		<xsl:otherwise>
            			<xsl:variable name="maxDate">
                    		<xsl:call-template name="maxDate">
                        		<xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Einddatum"/>
                    		</xsl:call-template>
                		</xsl:variable>

                		<xsl:call-template name="checkDateEquals">
                    		<xsl:with-param name="pThis" select="aw33:Einddatum"/>
                    		<xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Einddatum[text() = $maxDate]"/>
                    		<xsl:with-param name="pRule">TR014</xsl:with-param>
                		</xsl:call-template>
            		</xsl:otherwise>
            	</xsl:choose>	   
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="ingangsDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Ingangsdatum)"/>
                <xsl:variable name="eindDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Einddatum)"/>

                <xsl:if test=" $ingangsDatumCount = $eindDatumCount">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="aw33:Einddatum | *[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Einddatum"/>
                        <xsl:with-param name="pRule">
                            TR014
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="io31:Indicatie[*/io31:GeindiceerdeFunctie | */io31:GeindiceerdZorgzwaartepakket]" mode="TR014">
        <xsl:choose>
            <xsl:when test="io31:Einddatum">
                <xsl:choose>
            		<xsl:when test="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Einddatum) != 
            			count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*)">
            			<xsl:call-template name="addError">
                        	<xsl:with-param name="pElements" select="io31:Einddatum"/>
                        	<xsl:with-param name="pRule">
                            	TR014
                        	</xsl:with-param>
                    	</xsl:call-template>
            		</xsl:when>
            		<xsl:otherwise>
            			<xsl:variable name="maxDate">
                    		<xsl:call-template name="maxDate">
                        		<xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Einddatum"/>
                    		</xsl:call-template>
                		</xsl:variable>

                		<xsl:call-template name="checkDateEquals">
                    		<xsl:with-param name="pThis" select="io31:Einddatum"/>
                    		<xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Einddatum[text() = $maxDate]"/>
                    		<xsl:with-param name="pRule">TR014</xsl:with-param>
                		</xsl:call-template>
            		</xsl:otherwise>
            	</xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="ingangsDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Ingangsdatum)"/>
                <xsl:variable name="eindDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Einddatum)"/>

                <xsl:if test=" $ingangsDatumCount = $eindDatumCount">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="io31:Einddatum | *[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Einddatum"/>
                        <xsl:with-param name="pRule">
                            TR014
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="zk31:Indicatie[*/zk31:GeindiceerdeFunctie | */zk31:GeindiceerdZorgzwaartepakket]" mode="TR014">
        <xsl:choose>
            <xsl:when test="zk31:Einddatum">
                <xsl:choose>
            		<xsl:when test="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Einddatum) != 
            			count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*)">
            			<xsl:call-template name="addError">
                        	<xsl:with-param name="pElements" select="zk31:Einddatum"/>
                        	<xsl:with-param name="pRule">
                            	TR014
                        	</xsl:with-param>
                    	</xsl:call-template>
            		</xsl:when>
            		<xsl:otherwise>
            			<xsl:variable name="maxDate">
                    		<xsl:call-template name="maxDate">
                        		<xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Einddatum"/>
                    		</xsl:call-template>
                		</xsl:variable>

                		<xsl:call-template name="checkDateEquals">
                    		<xsl:with-param name="pThis" select="zk31:Einddatum"/>
                    		<xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Einddatum[text() = $maxDate]"/>
                    		<xsl:with-param name="pRule">TR014</xsl:with-param>
                		</xsl:call-template>
            		</xsl:otherwise>
            	</xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="ingangsDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Ingangsdatum)"/>
                <xsl:variable name="eindDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Einddatum)"/>

                <xsl:if test=" $ingangsDatumCount = $eindDatumCount">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="zk31:Einddatum | *[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Einddatum"/>
                        <xsl:with-param name="pRule">
                            TR014
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="zk33:Indicatie[*/zk33:GeindiceerdeFunctie | zk33:GeindiceerdZorgzwaartepakket]" mode="TR014">
        <xsl:choose>
            <xsl:when test="zk33:Einddatum">
                <xsl:choose>
            		<xsl:when test="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Einddatum) != 
            			count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*)">
            			<xsl:call-template name="addError">
                        	<xsl:with-param name="pElements" select="zk33:Einddatum"/>
                        	<xsl:with-param name="pRule">
                            	TR014
                        	</xsl:with-param>
                    	</xsl:call-template>
            		</xsl:when>
            		<xsl:otherwise>
            			<xsl:variable name="maxDate">
                    		<xsl:call-template name="maxDate">
                        		<xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Einddatum"/>
                    		</xsl:call-template>
                		</xsl:variable>

                		<xsl:call-template name="checkDateEquals">
                    		<xsl:with-param name="pThis" select="zk33:Einddatum"/>
                    		<xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Einddatum[text() = $maxDate]"/>
                    		<xsl:with-param name="pRule">TR014</xsl:with-param>
                		</xsl:call-template>
            		</xsl:otherwise>
            	</xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="ingangsDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Ingangsdatum)"/>
                <xsl:variable name="eindDatumCount" select="count(*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Einddatum)"/>

                <xsl:if test=" $ingangsDatumCount = $eindDatumCount">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="zk33:Einddatum | *[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Einddatum"/>
                        <xsl:with-param name="pRule">
                            TR014
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
