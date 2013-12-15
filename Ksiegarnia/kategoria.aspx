<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="kategoria.aspx.cs" Inherits="Ksiegarnia.kategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class=zawartosc>
        <div class=formularz>

            <asp:DataList ID="DataList2" runat="server" DataSourceID="sqlsource_Kategoria" 
                RepeatColumns="1">
                <ItemTemplate>



                <div id=kategoriaDivEmpty runat=server style="font-size:16px;margin:0 auto;" visible=<%# Convert.ToBoolean(Eval("czyIstniejaKsiazki")) ? false : true %> >
                    Brak książek w kategorii "
                    <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>'></asp:Label>
                    "
                </div>
                <div id=kategoriaDivFull runat=server style="font-size:16px;margin:0 auto;" visible=<%# Convert.ToBoolean(Eval("czyIstniejaKsiazki")) %>>
                    Książki z kategorii "
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwa") %>'></asp:Label>
                    "
                </div>

                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="sqlsource_Kategoria" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CS %>" 
                
                SelectCommand="SELECT DISTINCT kat.nazwa, CASE WHEN EXISTS (SELECT nazwa FROM [Ksiazka] WHERE id_kategoria = @id_kategoria) THEN 'TRUE' ELSE 'FALSE' END AS czyIstniejaKsiazki FROM Kategorie AS kat CROSS JOIN Ksiazka AS ks WHERE (kat.id_kategoria = @id_kategoria)">
            <SelectParameters>
                 <asp:RouteParameter Name="id_kategoria" RouteKey="kategoria" 
                    Type="Int32" />
            </SelectParameters></asp:SqlDataSource>

        </div>
        </div>

   

        <div class='produkty'>
        <div class=label><label id="Labelglowny" runat=server></label></div>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="id_ksiazki" 
            DataSourceID="SqlDataSource1" RepeatColumns="3" CellPadding="4" 
            ForeColor="#333333" HorizontalAlign="Center"  CellSpacing="16">
            <AlternatingItemStyle />
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
           </div>

              
             
                     <div class=cenaKsiazki style='position:absolute;left:10px;bottom:12px;'>
                 <asp:Label ID="cenaLabel" runat="server" class='cena' Text='<%# Eval("cena") + " zł"%>' /></div>
                  </a>
            <div style="position:absolute;right:5px;bottom:15px;">
                       <asp:Button ID="Koszyk_dodaj" runat="server" class='koszyk_dodaj'
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            SelectCommand="SELECT * FROM [Ksiazka] WHERE (id_kategoria = @id_kategoria)">
            <SelectParameters>
                 <asp:RouteParameter Name="id_kategoria" RouteKey="kategoria" 
                    Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>

            </div>


</asp:Content>
