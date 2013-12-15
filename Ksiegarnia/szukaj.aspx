<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="szukaj.aspx.cs" Inherits="Ksiegarnia.szukaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class=zawartosc>
        <div class=formularz>


                <div id=labelwyniki runat=server style="font-size:16px;margin:0 auto;">
                    
                </div>
                           <div id="div_labelxx" runat=server><br /><div id="div_labelxyx" class='label info'  ><label id="Labelxx" runat=server></label></div></div>


        </div>
        </div>

        <div class='produkty'>
        <div class=label><label id="Labelglowny" runat=server></label></div>

        <asp:DataList ID="DataList1" runat="server" DataKeyField="id_ksiazki" 
            DataSourceID="SqlDataSource12" RepeatColumns="3" CellPadding="4" 
            ForeColor="#333333" HorizontalAlign="Center" CellSpacing="16">
            <AlternatingItemStyle  />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle  BorderColor="Black" />
         <ItemTemplate>
            <div id=dodaj_przedmiot style="box-shadow:0 2px 5px black;border-radius:12px;">
               <a class='produkt_link' href='<%# "/ksiazka/" + Eval("id_ksiazki") %>'>
            <div class='produkty-lista' style='height:170px;height:200px;position:relative;'>

            <div style='margin-left:auto;margin-right:auto;width:105px;min-height:105px;max-height:105px;text-align:center;top:5px;'>
            <asp:Image ID="Image1" runat="server" style='max-height:100px;max-width:100px;' ImageUrl='<%# "img/"+Eval("id_ksiazki")+"/"+Eval("id_ksiazki")+".jpg" %>' />
            </div> 
            <div class='wstazka' style='float:left;height:35px;word-wrap: break-word;overflow:hidden;'>
           
                              <asp:Label ID="labelIDKsiazka" Visible=false runat="server" Text='<%# Eval("id_ksiazki") %>'></asp:Label>
                <asp:Label ID="nazwaLabel" class='tytułKsiazki' runat="server" Text='<%# Eval("nazwa") %>' />
           
              
             
                     <div class=cenaKsiazki style='position:absolute;left:10px;bottom:12px;'>
                 <asp:Label ID="cenaLabel" runat="server" class='cena' Text='<%# Eval("cena") + " zł"%>' /></div>
                  </a>
            <div style="position:absolute;right:5px;bottom:15px;">
                       <asp:Button ID="Koszyk_dodaj" runat="server" class=koszyk_dodaj
                     Text="" visible='<%# Convert.ToBoolean(Eval("dostepnosc")) %>'
                    onclick="Koszyk_dodaj_Click" />
                                <div id="Div1" runat=server style='border-top:1px dashed #bbb;position:Absolute;top:40px;right:0px;padding-top:10px;' visible='<%# Convert.ToBoolean(Eval("dostepnosc")) %>'>

                 
           <asp:Label ID="Label2" runat="server"  Text='<%#  Convert.ToBoolean(Eval("dostepnosc")) ? "" : "brak produktu"%>' />
           </div>
                    </div>
                </div> 
                <br />
              </div>
             
              </div>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            
                SelectCommand="SELECT * FROM [Ksiazka] WHERE (([nazwa] LIKE '%' + @nazwa + '%') OR ([opis] LIKE '%' + @opis + '%'))">
            <SelectParameters>
                <asp:QueryStringParameter Name="nazwa" QueryStringField="q" Type="String" />
                <asp:QueryStringParameter Name="opis" QueryStringField="q" Type="String" />
            
            </SelectParameters>
            </asp:SqlDataSource>

         
            </div>
    </div>
</asp:Content>
