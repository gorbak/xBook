<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="ksiazka.aspx.cs" Inherits="Ksiegarnia.ksiazka" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script type="text/javascript"  src="/jquery-2.0.0.min.js"></script>
<script type="text/javascript"  src="/limit.js"></script>
   <div class=zawartosc>
        <div class='produkty'>

        <div class=formularz>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="produktID" 
            DataSourceID="SqlDataSource1" RepeatColumns="5" CellPadding="4" 
            ForeColor="#333333" HorizontalAlign="Center" CellSpacing="6">
            <AlternatingItemStyle />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle  />
           <ItemTemplate >
           
            <div style='width:750px;height:100px;position:relative;' class='styl-1'>
 
            <div style='float:left;color:#ff7700;' >
           
                

                <asp:Label ID="nazwaLabel" runat="server" class='naglowek_produktu' Text='<%# Eval("nazwa") %>' />
                &nbsp;
               <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                <br />
                            <!---\zdjecia\produkty\--->
            <div style='float:left;width:105px;height:100px;max-height:100px;text-align:center;margin-top:10px;' >
            <asp:Image ID="Image1" runat="server" style='max-height:100px;max-width:100px;' ImageUrl='<%# "zdjecia/produkty/"+Eval("nazwa")+Eval("produktID")+".jpg" %>' />
            </div>
             
                 <br /><br /><br /><br /><br /><br />
                 Opis Produktu:
                 <br />
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("opis") %>' /></div>
                <br />
                <asp:Label ID="produktIDLabel" Visible=false runat="server" Text='<%# Eval("produktID") %>'></asp:Label>
                <br />
                
                 <div style='position:absolute;top:0px;right:05px;font-weight:bold;'>
                 Cena: 
                 <asp:Label ID="cenaLabel" runat="server" class='cena big' style='font-weight:normal;' Text='<%# Eval("cena") + " zł"%>' /></div>
                <br />
                <div id="Div1" runat=server style='width:150px;text-align:right;border-top:1px dashed #bbb;position:Absolute;top:40px;right:0px;padding-top:10px;color:#f70;' visible='<%# Convert.ToBoolean(Eval("dostepnosc")) ? false : true %>'>
                <asp:Label ID="Label3" runat="server"  Text='<%#  Convert.ToBoolean(Eval("dostepnosc")) ? "" : "brak produktu"%>' />
                </div>
                <div runat=server style='border-top:1px dashed #bbb;position:Absolute;top:40px;right:0px;padding-top:10px;' visible='<%# Convert.ToBoolean(Eval("dostepnosc")) %>'>

                 <asp:TextBox runat='server' ID="input_bialy_ilosc" class='input_bialy input_b_i' type="text" style='padding:10px;padding-top:5px;padding-bottom:5px;width:28px;text-align:center;' value="1" ValidationGroup="g1" /> <div style='position:absolute;top:40px;' class="plus_minus_przyciski"><input type='button' ID="przycisk_minus"  value=" "  class='plus_minus minus'/><input type='button' ID="przycisk_plus" value=" "   class='plus_minus'/></div>
                <asp:Button ID="Koszyk_dodaj" runat="server" class=koszyk_dodaj
                     Text=" " visible='<%# Convert.ToBoolean(Eval("dostepnosc")) %>'
                    onclick="Koszyk_dodaj_Click" /> <asp:Label ID="Label2" runat="server"  Text='<%#  Convert.ToBoolean(Eval("dostepnosc")) ? "" : "brak produktu"%>' />
                    </div>
                </div> 
              </div>
           
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS %>" 
            SelectCommand="SELECT * FROM [produkty] WHERE ([produktID] = @produktID)">
            <SelectParameters>
                <asp:RouteParameter Name="produktID" RouteKey="produkt" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            </div>

            <script type="text/javascript">

                $("#przycisk_minus").click(function () {
                    var ile = $('.input_b_i').val() - 1;
                    if (ile < 1) { ile = 1 }
                    $('.input_b_i').attr('value', ile);
                });

                $("#przycisk_plus").click(function () {
                    var ile = $('.input_b_i').val();
                    ile++;
                    if (ile > 9999) { ile = 9999 }
                    $('.input_b_i').attr('value', ile);
                });

                $('.input_b_i').focus(
    function () {
        $(this).attr('value', '');
    });

                $('.input_b_i').blur(
    function () {
        var wartosc = $('.input_b_i').val()
        if (wartosc == '') {
            $(this).attr('value', '1');
        } else {
            $(this).attr('value', wartosc);
        }
    });

                if ($('.input_b_i').attr("value") == 1) { }
                $('.input_b_i').limit('4');
             </script>
    </div>
    </div>
</asp:Content>
