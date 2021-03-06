create or replace package Pkg_Usu_Parametros is

  
  Procedure Sp_Get_Perfis(pAplicacao In t_usu_perfil.usu_aplicacao_codigo%Type,
                          pCursor      Out Types.cursorType,
                          pStatus      Out Char,
                          pMessage     Out Varchar2);
                          
  Procedure Sp_Get_Perfil(pCodigo  In t_usu_perfil.usu_perfil_codigo%Type,
                          pCursor  Out Types.cursorType,
                          pStatus  Out Char,
                          pMessage Out Varchar2);
                          
  Procedure Sp_Get_PerfisContemDescricao(pDescricao In t_Usu_Perfil.Usu_Perfil_Descricao%Type,
                                         pAplicacao In t_usu_perfil.usu_aplicacao_codigo%Type,
                                         pCursor    Out Types.cursorType, 
                                         pStatus    Out Char, 
                                         pMessage   Out Varchar2);                         
                          
  Procedure Sp_Get_Aplicacao(pCodigo  In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                             pCursor  Out Types.cursorType,
                             pStatus  Out Char,
                             pMessage Out Varchar2);
                             
  Procedure Sp_Get_AplicacaoPerfis(pAplicacao In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                                   pCursor    Out Types.cursorType,
                                   pStatus    Out Char,
                                   pMessage   Out Varchar2);    
                                   
  Procedure Sp_Get_AplicacaoPerfilUsuarios(pAplicacao In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                                           pPerfil    In t_Usu_Perfil.Usu_Perfil_Codigo%Type,
                                           pCursor    Out Types.cursorType,
                                           pStatus    Out Char,
                                           pMessage   Out Varchar2);     
                                           
  Procedure Sp_Get_AplicacaoPerfil(pAplicacao In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                                   pPerfil    In t_Usu_Perfil.Usu_Perfil_Codigo%Type,
                                   pUsuario   In t_Usu_Aplicacaoperfil.Usu_Usuario_Codigo%Type,
                                   pCursor    Out Types.cursorType,
                                   pStatus    Out Char,
                                   pMessage   Out Varchar2);    
                                   
  Procedure Sp_Set_UpdatePerfil(pXmlIn     In Varchar2,
                                pCodigoOld In t_Usu_Perfil.Usu_Perfil_Codigo%Type,
                                pStatus    Out Char,
                                pMessage   Out Varchar2);  
                                
  Procedure Sp_Set_InsertPerfil(pXmlIn     In Varchar2,
                                pStatus    Out Char,
                                pMessage   Out Varchar2); 
                                
  Procedure Sp_Set_UpdateAplicacaoPerfil(pAppPerfilXmlIn In varchar2,
                                         pPerfil         In t_Usu_Aplicacaoperfil.Usu_Perfil_Codigo%Type,
                                         pAplicacao      In t_usu_aplicacaoperfil.usu_aplicacao_codigo%Type,
                                         pUsuario        In t_usu_aplicacaoperfil.usu_usuario_codigo%Type,
                                         pStatus         Out Char,
                                         pMessage        Out varchar2);       
                                         
  Procedure Sp_Set_InsertAplicacaoPerfil(pAppPerfilXmlIn In varchar2,
                                         pStatus         Out Char,
                                         pMessage        Out varchar2);                                                                                                                                                                                                                                                                                  

end Pkg_Usu_Parametros;
/
create or replace package body Pkg_Usu_Parametros is

/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 20/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Atraves do xml perfil retorna uma linha da T_USU_PERFIL
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pXmlIn = Xml do t_Usu_perfil
  *                    Ex do XmlIn:
                          <perfil>
                            <aplicacao>
                              <codigo>carreg</codigo>
                            </aplicacao>
                            <codigo>FECH_MASSA_NOTAS</codigo>
                            <descricao>Fechamento em massa Notas selecionadas 1 a 1</descricao>
                            <parat>S</parat>
                            <paran1>0.0</paran1>
                            <paran2>0.0</paran2>
                            <descricaoResumida>Fechamento em massa Notas</descricaoResumida>
                            <horario>SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS</horario>
                            <paran3>0.0</paran3>
                            <paran4>0.0</paran4>
                            <paran5>0.0</paran5>
                            <paran6>0.0</paran6>
                            <observacao>S = Habilitado | N = Nao Habilitado</observacao>
                            <vigencia>
                              <time>1392076800000</time>
                              <timezone>America/Sao_Paulo</timezone>
                            </vigencia>
                          </perfil>
  ************************************************************************************************/   
  function Fn_To_Perfil(pXmlIn In Varchar2) return t_Usu_Perfil%RowType
    As
    vPerfilRow T_USU_PERFIL%RowType;
    Begin
        for p_cursor in( SELECT extractValue(VALUE(t), '/perfil/codigo')                  codigo,
                                extractValue(VALUE(t), '/perfil/aplicacao/codigo')        aplicacaoCodigo,
                                extractValue(VALUE(t), '/perfil/descricao')               descricao,
                                extractValue(VALUE(t), '/perfil/parat')                   parat,
                                extractValue(VALUE(t), '/perfil/descricaoResumida')       descricaoResumida,
                                extractValue(VALUE(t), '/perfil/paran1')                  paran1,
                                extractValue(VALUE(t), '/perfil/paran2')                  paran2,
                                extractValue(VALUE(t), '/perfil/paran3')                  paran3,
                                extractValue(VALUE(t), '/perfil/paran4')                  paran4,
                                extractValue(VALUE(t), '/perfil/paran5')                  paran5,
                                extractValue(VALUE(t), '/perfil/paran6')                  paran6,
                                extractValue(VALUE(t), '/perfil/horario')                 horario,
                                extractValue(VALUE(t), '/perfil/observacao')              observacao,
                                extractValue(VALUE(t), '/perfil/vigencia')                vigencia,
                                extractValue(VALUE(t), '/perfil/usuarioCadastro')         usuario,
                                extractValue(VALUE(t), '/perfil/usuarioAlterou')          usuarioAlterou
                           FROM TABle(XMLSequence(extract(xmltype.createXML(pXmlIn), '/perfil'))) t
                          WHERE 0 = 0)
           loop
                  vPerfilRow.Usu_Perfil_Codigo     := p_cursor.codigo;
                  vPerfilRow.Usu_Aplicacao_Codigo  := p_Cursor.Aplicacaocodigo;
                  vPerfilRow.Usu_Perfil_Descricao  := p_cursor.descricao;
                  vPerfilRow.Usu_Perfil_Parat      := p_cursor.parat;
                  vPerfilRow.Usu_Perfil_Descricaoresumida := p_cursor.descricaoresumida;
                  vPerfilRow.Usu_Perfil_Paran1     := Replace(p_cursor.paran1, '.',',');
                  vPerfilRow.Usu_Perfil_Paran2     := Replace(p_cursor.paran2, '.',',');
                  vPerfilRow.Usu_Perfil_Paran3     := Replace(p_cursor.paran3, '.',',');
                  vPerfilRow.Usu_Perfil_Paran4     := Replace(p_cursor.paran4, '.',',');
                  vPerfilRow.Usu_Perfil_Paran5     := Replace(p_cursor.paran5, '.',',');
                  vPerfilRow.Usu_Perfil_Paran6     := Replace(p_cursor.paran6, '.',',');
                  vPerfilRow.Usu_Perfil_Horario    := p_cursor.horario;
                  vPerfilRow.Usu_Perfil_Observacao := p_cursor.observacao;
                  vPerfilRow.Usu_Perfil_Vigencia   := p_cursor.vigencia;
                  vPerfilRow.Usu_Usuario_Codigocad := p_cursor.usuario;
                  vPerfilRow.Usu_Usuario_Codigoalt := p_cursor.usuarioAlterou;
           end loop;
        return vPerfilRow;
    End Fn_To_Perfil;
    
/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 01/04/2015                                                                                                                                                             
  * FUNCINALIDADE    : Atraves do xml aplicacaoPerfil retorna uma linha da T_USU_APLICACAOPERFIL
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAppPerfilXmlIn = Xml do t_Usu_aplicacaoperfil
  *                    Ex do Xml:
                              <aplicacaoPerfil>
                                 <aplicacao>
                                      <codigo>carreg    </codigo>
                                 </aplicacao>
                                 <perfil>
                                      <codigo>ALTER_TRANSF</codigo>
                                  </perfil>
                                  <usuario>jsantos   </usuario>
                                  <grupoCodigo>00000</grupoCodigo>
                                  <rota>000</rota>
                                  <ativo>S</ativo>
                                  <usuarioCadastro>jsantos   </usuarioCadastro>
                                  <usuarioAlteracao>jsantos   </usuarioAlteracao>
                                  <parat>N</parat>
                                  <paran1>0.0</paran1>
                                  <paran2>0.0</paran2>
                                  <paran3>0.0</paran3>
                                  <paran4>0.0</paran4>
                                  <paran5>0.0</paran5>
                                  <paran6>0.0</paran6>
                                  <horario>SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS</horario>
                              </aplicacaoPerfil>
  ************************************************************************************************/       
    Function Fn_To_AplicacaoPerfil(pAppPerfilXmlIn In Varchar2) return t_Usu_Aplicacaoperfil%RowType
    As
    vAppPerfil t_Usu_Aplicacaoperfil%RowType;
    Begin
      for ap in (select extractValue(VALUE(t),'/aplicacaoPerfil/aplicacao/codigo') aplicacao,
                        extractValue(VALUE(t),'/aplicacaoPerfil/perfil/codigo')    perfil,
                        extractValue(VALUE(t),'/aplicacaoPerfil/perfil/descricao') descricao,
                        extractValue(VALUE(t),'/aplicacaoPerfil/usuario')          usuario,
                        extractValue(VALUE(t),'/aplicacaoPerfil/grupoCodigo')      grupoCodigo,
                        extractValue(VALUE(t),'/aplicacaoPerfil/rota')             rota,
                        extractValue(VALUE(t),'/aplicacaoPerfil/ativo')            ativo,
                        extractValue(VALUE(t),'/aplicacaoPerfil/validade')         validade,
                        extractValue(VALUE(t),'/aplicacaoPerfil/vigencia')         vigencia,                        
                        extractValue(VALUE(t),'/aplicacaoPerfil/usuarioCadastro')  usuarioCadastro,
                        extractValue(VALUE(t),'/aplicacaoPerfil/usuarioAlteracao') usuarioAlteracao,
                        extractValue(VALUE(t),'/aplicacaoPerfil/parat')            parat,
                        extractValue(VALUE(t),'/aplicacaoPerfil/paran1')           paran1,
                        extractValue(VALUE(t),'/aplicacaoPerfil/paran2')           paran2,
                        extractValue(VALUE(t),'/aplicacaoPerfil/paran3')           paran3,
                        extractValue(VALUE(t),'/aplicacaoPerfil/paran4')           paran4,
                        extractValue(VALUE(t),'/aplicacaoPerfil/paran5')           paran5,
                        extractValue(VALUE(t),'/aplicacaoPerfil/paran6')           paran6,
                        extractValue(VALUE(t),'/aplicacaoPerfil/horario')          horario
                    from Table(XMLSequence(extract(xmltype.createXML(pAppPerfilXmlIn), '/aplicacaoPerfil'))) t)
      loop
          vAppPerfil.Usu_Aplicacao_Codigo  := ap.aplicacao;
          vAppPerfil.Usu_Perfil_Codigo     := ap.perfil;
          vAppPerfil.Usu_Aplicacaoperfil_Descricao := ap.descricao;
          vAppPerfil.Usu_Usuario_Codigo    := ap.usuario;
          vAppPerfil.Usu_Grupo_Codigo      := ap.grupoCodigo;
          vAppPerfil.Glb_Rota_Codigo       := ap.rota;
          vAppPerfil.Usu_Aplicacaoperfil_Ativo := ap.ativo;
          vAppPerfil.Usu_Aplicacaoperfil_Validade := ap.validade;
          vAppPerfil.Usu_Aplicacaoperfil_Vigencia := ap.vigencia;          
          vAppPerfil.Usu_Usuario_Codigocad := ap.usuariocadastro;
          vAppPerfil.Usu_Usuario_Codigoalt := ap.usuarioalteracao;
          vAppPerfil.Usu_Aplicacaoperfil_Parat := ap.parat;
          vAppPerfil.Usu_Aplicacaoperfil_Paran1 := Replace(ap.paran1, '.',',');
          vAppPerfil.Usu_Aplicacaoperfil_Paran2 := Replace(ap.paran2, '.',',');
          vAppPerfil.Usu_Aplicacaoperfil_Paran3 := Replace(ap.paran3, '.',',');
          vAppPerfil.Usu_Aplicacaoperfil_Paran4 := Replace(ap.paran4, '.',',');
          vAppPerfil.Usu_Aplicacaoperfil_Paran5 := Replace(ap.paran5, '.',',');
          vAppPerfil.Usu_Aplicacaoperfil_Paran6 := Replace(ap.paran6, '.',',');
          vAppPerfil.Usu_Aplicacaoperfil_Horario:= ap.horario;
      end loop;
      return vAppPerfil;
    End Fn_To_AplicacaoPerfil;


/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 13/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar lista de perfis(parametros) de uma aplicacao 
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAplicacao = codigo da aplicacao (usu_aplicacao_codigo)
  *                    pCursor = Cursor dos valores t_usu_perfil
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/
  Procedure Sp_Get_Perfis(pAplicacao In t_usu_perfil.usu_aplicacao_codigo%Type,
                          pCursor      Out Types.cursorType,
                          pStatus      Out Char,
                          pMessage     Out Varchar2)
  As
  Begin
    
      Open pCursor For
        Select *
           From t_usu_perfil p
           where p.usu_aplicacao_codigo = pAplicacao
           order by p.usu_perfil_codigo;
           
      pStatus := 'N';
      pMessage := 'OK';
  
  End Sp_Get_Perfis;    
  
/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 13/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar um perfil(parametro) por codigo
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pCodigo = codigo do perfil (usu_perfil_codigo)
  *                    pCursor = Cursor com uma linha t_usu_perfil
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/  
  Procedure Sp_Get_Perfil(pCodigo  In t_usu_perfil.usu_perfil_codigo%Type,
                          pCursor  Out Types.cursorType,
                          pStatus  Out Char,
                          pMessage Out Varchar2)
  As
  Begin
    
      Open pCursor For
        Select *
           From t_usu_perfil p
           where p.usu_perfil_codigo = pCodigo;
           
      pStatus := 'N';
      pMessage := 'OK';
  
  End Sp_Get_Perfil;
  
  
/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 06/04/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar lista perfil(parametro) que contem a descricao passada de uma aplicacao
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pDescricao = descricao do perfil (usu_perfil_descricao)
  *                    pAplicacao = codigo da Aplicacao (usu_aplicacao_codigo)
  *                    pCursor = Cursor lista t_usu_perfil
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/    
  Procedure Sp_Get_PerfisContemDescricao(pDescricao In t_Usu_Perfil.Usu_Perfil_Descricao%Type,
                                         pAplicacao In t_usu_perfil.usu_aplicacao_codigo%Type,
                                         pCursor    Out Types.cursorType, 
                                         pStatus    Out Char, 
                                         pMessage   Out Varchar2)
  As
  Begin
    begin
      
      open pCursor for 
      select *
        from t_Usu_Perfil p
        where trim(p.usu_perfil_codigo) like '%'||Upper(trim(pDescricao))||'%'
          and trim(p.usu_aplicacao_codigo) = trim(pAplicacao)
        order by p.usu_perfil_codigo;

      pStatus  := 'N';
      pMessage := 'OK!';  
      
    exception when others then
      pStatus  := 'E';
      pMessage := sqlerrm;
    end;       
  End Sp_Get_PerfisContemDescricao;  

/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 16/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar um perfil(parametro) por codigo
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pCodigo = codigo da aplicacao (usu_aplicacao_codigo)
  *                    pCursor = Cursor com uma linha t_usu_aplicacao
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/ 
  Procedure Sp_Get_Aplicacao(pCodigo  In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                             pCursor  Out Types.cursorType,
                             pStatus  Out Char,
                             pMessage Out Varchar2)
  As
  Begin
    
      Open pCursor For
        Select *
           From t_usu_aplicacao a
           where a.usu_aplicacao_codigo = pCodigo;
           
      pStatus := 'N';
      pMessage := 'OK';
  
  End Sp_Get_Aplicacao;

/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 16/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar lista de aplicacaoPerfil(perfis dos usuario por aplicacao) por aplicacao
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAplicacao = codigo da aplicacao (usu_aplicacao_codigo)
  *                    pCursor = Cursor com valores t_usu_aplicacaoperfil
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/ 
  Procedure Sp_Get_AplicacaoPerfis(pAplicacao In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                                   pCursor    Out Types.cursorType,
                                   pStatus    Out Char,
                                   pMessage   Out Varchar2)
  As
  Begin
    
      Open pCursor For
        Select *
           From t_Usu_Aplicacaoperfil ap
           where ap.usu_aplicacao_codigo = pAplicacao;
           
      pStatus := 'N';
      pMessage := 'OK';
  
  End Sp_Get_AplicacaoPerfis;

/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 16/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar lista de aplicacaoPerfil(perfis dos usuario por aplicacao) por 
  *                      aplicacao e perfil
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAplicacao = codigo da aplicacao (usu_aplicacao_codigo)
  *                    pPerfil = codigo do perfil (usu_perfil_codigo)
  *                    pCursor = Cursor com valores t_usu_aplicacaoperfil
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/   
  Procedure Sp_Get_AplicacaoPerfilUsuarios(pAplicacao In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                                           pPerfil    In t_Usu_Perfil.Usu_Perfil_Codigo%Type,
                                           pCursor    Out Types.cursorType,
                                           pStatus    Out Char,
                                           pMessage   Out Varchar2)
  As
  Begin
    
      Open pCursor For
        Select *
           From t_Usu_Aplicacaoperfil ap
           where ap.usu_aplicacao_codigo = pAplicacao
             and ap.usu_perfil_codigo    = pPerfil;
           
      pStatus := 'N';
      pMessage := 'OK';
  
  End Sp_Get_AplicacaoPerfilUsuarios;  

/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 17/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Buscar lista de aplicacaoPerfil(perfis dos usuario por aplicacao) por aplicacao
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAplicacao = codigo da aplicacao (usu_aplicacao_codigo)
  *                    pPerfil = codigo do perfil (usu_perfil_codigo)
  *                    pUsuario = codigo do usuario (usu_usuario_codigo)
  *                    pCursor = Cursor com uma linha t_usu_aplicacaoperfil
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/     
  Procedure Sp_Get_AplicacaoPerfil(pAplicacao In t_usu_aplicacao.usu_aplicacao_codigo%Type,
                                   pPerfil    In t_Usu_Perfil.Usu_Perfil_Codigo%Type,
                                   pUsuario   In t_Usu_Aplicacaoperfil.Usu_Usuario_Codigo%Type,
                                   pCursor    Out Types.cursorType,
                                   pStatus    Out Char,
                                   pMessage   Out Varchar2)
  As
  Begin
    
      Open pCursor For
        Select *
           From t_Usu_Aplicacaoperfil ap
           where ap.usu_aplicacao_codigo = pAplicacao
             and ap.usu_perfil_codigo    = pPerfil
             and ap.usu_usuario_codigo   = pUsuario;
           
      pStatus := 'N';
      pMessage := 'OK';
  
  End Sp_Get_AplicacaoPerfil; 
  
/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 20/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Alterar O Perfil(Parametro)
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pXmlIn = Xml do t_Usu_perfil
  *                    Ex do XmlIn:
                          <perfil>
                            <aplicacao>
                              <codigo>carreg</codigo>
                            </aplicacao>
                            <codigo>FECH_MASSA_NOTAS</codigo>
                            <descricao>Fechamento em massa Notas selecionadas 1 a 1</descricao>
                            <parat>S</parat>
                            <paran1>0.0</paran1>
                            <paran2>0.0</paran2>
                            <descricaoResumida>Fechamento em massa Notas</descricaoResumida>
                            <horario>SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS</horario>
                            <paran3>0.0</paran3>
                            <paran4>0.0</paran4>
                            <paran5>0.0</paran5>
                            <paran6>0.0</paran6>
                            <observacao>S -&gt; Habilitado&#xd;
                          N -&gt; Nao Habilitado</observacao>
                            <vigencia>
                              <time>1392076800000</time>
                              <timezone>America/Sao_Paulo</timezone>
                            </vigencia>
                          </perfil>
                        
  *                    pCodigoOld = codigo do perfil para alteracao do mesmo, caso envio do codigo no xml for diferente!
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/    
  Procedure Sp_Set_UpdatePerfil(pXmlIn     In Varchar2,
                                pCodigoOld In t_Usu_Perfil.Usu_Perfil_Codigo%Type,
                                pStatus    Out Char,
                                pMessage   Out Varchar2)
  As
  vPerfilRow t_Usu_Perfil%RowType;
  Begin
  
      --Insert Into Dropme d (a, x) values('PERFIL_WEB', pXmlIn);commit;
  
      Begin
          vPerfilRow := Fn_To_Perfil(pXmlIn);
          
          Update t_Usu_Perfil p
             set p.usu_perfil_codigo     = vPerfilRow.Usu_Perfil_Codigo,
                 p.usu_perfil_descricao  = vPerfilRow.Usu_Perfil_Descricao,
                 p.usu_perfil_parat      = vPerfilRow.Usu_Perfil_Parat,
                 p.usu_perfil_dtalt      = sysdate,
                 p.usu_usuario_codigoalt = 'jsantos',
                 p.usu_perfil_paran1     = vPerfilRow.Usu_Perfil_Paran1,
                 p.usu_perfil_paran2     = vPerfilRow.Usu_Perfil_Paran2,
                 p.usu_perfil_paran3     = vPerfilRow.Usu_Perfil_Paran3,
                 p.usu_perfil_paran4     = vPerfilRow.Usu_Perfil_Paran4,
                 p.usu_perfil_paran5     = vPerfilRow.Usu_Perfil_Paran5,
                 p.usu_perfil_paran6     = vPerfilRow.Usu_Perfil_Paran6,
                 p.usu_perfil_parad1     = vPerfilRow.Usu_Perfil_Parad1,
                 p.usu_perfil_parad2     = vPerfilRow.Usu_Perfil_Parad2,
                 p.usu_perfil_parad3     = vPerfilRow.Usu_Perfil_Parad3,
                 p.usu_perfil_parad4     = vPerfilRow.Usu_Perfil_Parad4,
                 p.usu_perfil_descricaoresumida = vPerfilRow.Usu_Perfil_Descricaoresumida,
                 p.usu_perfil_horario    = vPerfilRow.Usu_Perfil_Horario,
                 p.usu_perfil_observacao = vPerfilRow.Usu_Perfil_Observacao,
                 p.usu_perfil_vigencia   = vPerfilRow.Usu_Perfil_Vigencia
           where p.usu_perfil_codigo = pCodigoOld;
           
          pStatus := 'N';
          pMessage := 'Perfil alterado com Sucesso! ' || pCodigoOld || ' - ' || vPerfilRow.Usu_Perfil_Codigo; 
      Exception
        When Others Then
          pStatus := 'E';
          pMessage := sqlerrm;
      End;       
  End Sp_Set_UpdatePerfil;
  
/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 27/03/2015                                                                                                                                                             
  * FUNCINALIDADE    : Inserir novo Perfil(Parametro)
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pXmlIn = Xml do t_Usu_perfil
  *                    Ex do XmlIn:
                          <perfil>
                            <aplicacao>
                              <codigo>carreg</codigo>
                            </aplicacao>
                            <codigo>FECH_MASSA_NOTAS</codigo>
                            <descricao>Fechamento em massa Notas selecionadas 1 a 1</descricao>
                            <parat>S</parat>
                            <paran1>0.0</paran1>
                            <paran2>0.0</paran2>
                            <descricaoResumida>Fechamento em massa Notas</descricaoResumida>
                            <horario>SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS</horario>
                            <paran3>0.0</paran3>
                            <paran4>0.0</paran4>
                            <paran5>0.0</paran5>
                            <paran6>0.0</paran6>
                            <observacao>S=Habilitado N=Nao Habilitado</observacao>
                            <vigencia>
                              <time>1392076800000</time>
                              <timezone>America/Sao_Paulo</timezone>
                            </vigencia>
                          </perfil>
                        
  *                    pCodigoOld = codigo do perfil para alteracao do mesmo, caso envio do codigo no xml for diferente!
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/    
  Procedure Sp_Set_InsertPerfil(pXmlIn     In Varchar2,
                                pStatus    Out Char,
                                pMessage   Out Varchar2)
  As
  vPerfilRow t_Usu_Perfil%RowType;
  Begin
      Begin
          vPerfilRow := Fn_To_Perfil(pXmlIn);
          
          vPerfilRow.Usu_Perfil_Dtcad := sysdate;
          vPerfilRow.Usu_Perfil_Dtalt := sysdate;
          
          Insert Into T_USU_PERFIL values vPerfilRow;
           
          pStatus := 'N';
          pMessage := 'Perfil gravado com Sucesso! ' || ' - ' || vPerfilRow.Usu_Perfil_Codigo; 
      Exception
        When Others Then
          pStatus := 'E';
          pMessage := sqlerrm;
      End;       
  End Sp_Set_InsertPerfil;  

/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 01/04/2015                                                                                                                                                             
  * FUNCINALIDADE    : Altera a AplicacaoPerfil
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAppPerfilXmlIn = Xml do t_Usu_aplicacaoperfil
  *                    Ex do Xml:
                              <aplicacaoPerfil>
                                 <aplicacao>
                                      <codigo>carreg    </codigo>
                                 </aplicacao>
                                 <perfil>
                                      <codigo>ALTER_TRANSF</codigo>
                                      <paran1>0.0</paran1>
                                      <paran2>0.0</paran2>
                                      <paran3>0.0</paran3>
                                      <paran4>0.0</paran4>
                                      <paran5>0.0</paran5>
                                      <paran6>0.0</paran6>
                                  </perfil>
                                  <usuario>jsantos   </usuario>
                                  <grupoCodigo>00000</grupoCodigo>
                                  <rota>000</rota>
                                  <ativo>S</ativo>
                                  <usuarioCadastro>jsantos   </usuarioCadastro>
                                  <usuarioAlteracao>jsantos   </usuarioAlteracao>
                                  <parat>N</parat>
                                  <paran1>0.0</paran1>
                                  <paran2>0.0</paran2>
                                  <paran3>0.0</paran3>
                                  <paran4>0.0</paran4>
                                  <paran5>0.0</paran5>
                                  <paran6>0.0</paran6>
                                  <horario>SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS</horario>
                              </aplicacaoPerfil>
  *                    pPerfil = codigo do perfil (usu_perfil_codigo)
  *                    pAplicacao = codigo da aplicacao (usu_aplicacao_codigo)
  *                    pUsuario = codigo do usuario (usu_usuario_codigo)
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/   
  Procedure Sp_Set_UpdateAplicacaoPerfil(pAppPerfilXmlIn In varchar2,
                                         pPerfil         In t_Usu_Aplicacaoperfil.Usu_Perfil_Codigo%Type,
                                         pAplicacao      In t_usu_aplicacaoperfil.usu_aplicacao_codigo%Type,
                                         pUsuario        In t_usu_aplicacaoperfil.usu_usuario_codigo%Type,
                                         pStatus         Out Char,
                                         pMessage        Out varchar2)
  As
  vAppPerfil t_Usu_Aplicacaoperfil%rowType;
  Begin
     Begin
         --Insert Into Dropme d (a, x) values('APLICACAOPERFIL_WEB', pAppPerfilXmlIn);commit;
         vAppPerfil := Fn_To_AplicacaoPerfil(pAppPerfilXmlIn);
           
         Update t_Usu_Aplicacaoperfil ap
            set ap.usu_aplicacaoperfil_parat = vAppPerfil.Usu_Aplicacaoperfil_Parat,
                ap.usu_usuario_codigo        = vAppPerfil.Usu_Usuario_Codigo,
                ap.glb_rota_codigo           = vAppPerfil.Glb_Rota_Codigo,
                ap.usu_grupo_codigo          = vAppPerfil.Usu_Grupo_Codigo,
                ap.usu_aplicacaoperfil_dtalt = sysdate,
                ap.usu_usuario_codigoalt     = vAppPerfil.Usu_Usuario_Codigoalt,
                ap.usu_aplicacaoperfil_validade = vAppPerfil.Usu_Aplicacaoperfil_Validade,
                ap.usu_aplicacaoperfil_vigencia = vAppPerfil.Usu_Aplicacaoperfil_Vigencia,
                ap.usu_aplicacaoperfil_ativo = vAppPerfil.Usu_Aplicacaoperfil_Ativo
           where ap.usu_aplicacao_codigo = pAplicacao
             and ap.usu_perfil_codigo    = pPerfil
             and ap.usu_usuario_codigo   = pUsuario;
         Commit;  
         pStatus := 'N';
         pMessage := 'OK';
     Exception
       When Others Then
         Rollback;
         pStatus := 'E';
         pMessage := sqlerrm;
     End;     
  End Sp_Set_UpdateAplicacaoPerfil;          
  
/************************************************************************************************
  * PROGRAMA         : Parametros Web
  * DESENVOLVEDOR    : Diego Lirio                                                                              
  * DATA DE CRIACAO  : 10/04/2015                                                                                                                                                             
  * FUNCINALIDADE    : Insere nova AplicacaoPerfil
  * PARTICULARIDADES :                                                                          
  * PARAM. OBRIGAT.  : pAppPerfilXmlIn = Xml do t_Usu_aplicacaoperfil
  *                    Ex do Xml:
                              <aplicacaoPerfil>
                                 <aplicacao>
                                      <codigo>carreg    </codigo>
                                 </aplicacao>
                                 <perfil>
                                      <codigo>ALTER_TRANSF</codigo>
                                      <paran1>0.0</paran1>
                                      <paran2>0.0</paran2>
                                      <paran3>0.0</paran3>
                                      <paran4>0.0</paran4>
                                      <paran5>0.0</paran5>
                                      <paran6>0.0</paran6>
                                  </perfil>
                                  <usuario>jsantos   </usuario>
                                  <grupoCodigo>00000</grupoCodigo>
                                  <rota>000</rota>
                                  <ativo>S</ativo>
                                  <usuarioCadastro>jsantos   </usuarioCadastro>
                                  <usuarioAlteracao>jsantos   </usuarioAlteracao>
                                  <parat>N</parat>
                                  <paran1>0.0</paran1>
                                  <paran2>0.0</paran2>
                                  <paran3>0.0</paran3>
                                  <paran4>0.0</paran4>
                                  <paran5>0.0</paran5>
                                  <paran6>0.0</paran6>
                                  <horario>SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS</horario>
                              </aplicacaoPerfil>
  *                    pStatus = E=ERRO, N=Normal
  *                    pMessage = Mensagem de ERRO ou mensagem de Normal quando necessário
  ************************************************************************************************/   
  Procedure Sp_Set_InsertAplicacaoPerfil(pAppPerfilXmlIn In varchar2,
                                         pStatus         Out Char,
                                         pMessage        Out varchar2)
  As
  vAppPerfil t_Usu_Aplicacaoperfil%rowType;
  Begin
     Begin
         Insert Into Dropme d (a, x) values('INSERT_APLICACAOPERFIL_WEB', pAppPerfilXmlIn);commit;
         vAppPerfil := Fn_To_AplicacaoPerfil(pAppPerfilXmlIn);
         vAppPerfil.Usu_Aplicacaoperfil_Dtcad := sysdate;
         vAppPerfil.Usu_Aplicacaoperfil_Dtalt := sysdate;
         vAppPerfil.Usu_Aplicacaoperfil_Quenaltsa := 'A';
         vAppPerfil.Usu_Aplicacaoperfil_Horario := 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
         Insert Into t_Usu_Aplicacaoperfil values vAppPerfil;
         Commit;  
         pStatus := 'N';
         pMessage := 'OK';
     Exception
       When Others Then
         Rollback;
         pStatus := 'E';
         pMessage := sqlerrm;
     End;     
  End Sp_Set_InsertAplicacaoPerfil;                                     

end Pkg_Usu_Parametros;
/
