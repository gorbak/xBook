<%@ Page Title="" Language="C#" MasterPageFile="~/splitView.master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Ksiegarnia.useradmin.admin" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    Panel Administracyjny
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
    <script type="text/javascript"  src="/jquery-2.0.0.min.js"></script>
    <asp:ScriptManager ID="ScriptManager2" runat="server">
             </asp:ScriptManager>
                          <script type="text/javascript">

                              function czytajurl(input) {
                                  if (input.files && input.files[0]) {
                                      var reader = new FileReader();

                                      reader.onload = function (e) {
                                          $('#podglad').css('background-image', "url(" + e.target.result + ")");
                                          $('#podglad').css('background-size', "100%");
                                          $('#podglad').css('background-repeat', "no-repeat");
                                          $("#obraz_admin_up").html(" ");
                                      }
                                      reader.readAsDataURL(input.files[0]);
                                  }
                              }
             
             </script>

     <div id=uzytkownicy_admin runat='server' class="buttony_gridview_admin">


                         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         BackColor="#dedede" BorderColor="Tan" 
         CellPadding="2" DataKeyNames="id_user" DataSourceID="zrodlo_userzy" 
         ForeColor="Black" GridLines="None" Width="100%">
         <AlternatingRowStyle BackColor="#eeeeee" />
         <Columns>
             <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" 
                 ReadOnly="True" SortExpression="id_user" />
             <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
             <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" 
                 SortExpression="nazwisko" />
             <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
             <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
             <asp:BoundField DataField="haslo" HeaderText="haslo" SortExpression="haslo" />
             <asp:BoundField DataField="uprawnienia" HeaderText="uprawnienia" 
                 SortExpression="uprawnienia" />
                     <asp:CommandField ButtonType="Button" CancelText="Przerwij" DeleteText="Usuń" 
                     EditText="Zmień" HeaderText="Edycja" SelectText="Wybierz" 
                     ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" 
                     UpdateText="Aktualizuj" />
         </Columns>
         <FooterStyle BackColor="#aaaaaa" />
         <HeaderStyle BackColor="#0099ff" Font-Bold="True" />
         <PagerStyle BackColor="#00aaff" ForeColor="DarkSlateBlue" 
             HorizontalAlign="Center" />
         <SelectedRowStyle BackColor="#00aaff" ForeColor="GhostWhite" />
         <SortedAscendingCellStyle BackColor="#0AFAE7" />
         <SortedAscendingHeaderStyle BackColor="#0AC09E" />
         <SortedDescendingCellStyle BackColor="#01DB9C" />
         <SortedDescendingHeaderStyle BackColor="#02A47B" />
     </asp:GridView>
     <asp:SqlDataSource ID="zrodlo_userzy" runat="server" 
         ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT     *
FROM   [User]" DeleteCommand="DELETE FROM [User] Where login = @login" 
             UpdateCommand="UPDATE [User] SET imie = @imie, nazwisko = @nazwisko, mail = @mail, login = @login, uprawnienia = @uprawnienia, haslo = @haslo WHERE (login = @login)">
         <DeleteParameters>
             <asp:Parameter Name="login" />
         </DeleteParameters>
         <UpdateParameters>
             <asp:Parameter Name="imie" />
             <asp:Parameter Name="nazwisko" />
             <asp:Parameter Name="mail" />
             <asp:Parameter Name="login" />
             <asp:Parameter Name="uprawnienia" />
             <asp:Parameter Name="haslo" />
         </UpdateParameters>
         </asp:SqlDataSource>
         <br />
         </ContentTemplate>
         </asp:UpdatePanel>
         </div>

          <div id=ksiazki_admin runat='server'>
       <br />
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
         
         <asp:SqlDataSource ID="produktyDataSrsc" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             DeleteCommand="DELETE FROM Stan_magazynu Where id_magazynu = @produktID" SelectCommand="SELECT        *
FROM            [Ksiazka]" UpdateCommand="UPDATE [Ksiazka] SET nazwa = @nazwa, id_kategoria = @id_kategoria, cena = @cena, dostepnosc = @dostepnosc WHERE id_ksiazki = @produktID">
             <DeleteParameters>
                 <asp:Parameter Name="produktID" />
             </DeleteParameters>
             <UpdateParameters>
                 <asp:Parameter Name="nazwa" />
                 <asp:Parameter Name="id_kategoria" />
                 
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="dostepnosc" />
                 
                 <asp:Parameter Name="id_ksiazki" />
             </UpdateParameters>
         </asp:SqlDataSource>
         </ContentTemplate>
         </asp:UpdatePanel>

                 <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
               <div id=produkt_admin_lista runat='server' class='magazyn_admin'>
           <asp:DataList ID="DataList_produkty" runat="server" DataSourceID="SqlDataSource_produkty" 
                 RepeatColumns="3" DataKeyField="id_ksiazki" 
                 oneditcommand="DS_Produkty_EditCommand" 
                 onupdatecommand="DS_Produkty_UpdateCommand" RepeatDirection="Horizontal" ItemStyle-VerticalAlign="Top" 
                       ondeletecommand="DataList_produkty_DeleteCommand">
                 <EditItemTemplate>

                      <div  class='magazyn edytowany_magazyn'>
                 
                 <div class='ak_naglowek' style='position:relative;text-align:left !important;'>
                 <asp:Label ID="ProduktIDLabel" runat="server" class="label_opis_Admin tytul"  style='margin-left:6px;' Text='<%# Eval("id_ksiazki") %>' />
                 <!---<div ID="Label3" runat="server" class="label_opis_Admin tytul"  style='position:absolute;top:3px;margin:auto;margin-left:33%;width:60px !important;text-align:center;border-radius:40px 40px 0 0;' ></div> --->
                 <asp:Button ID="Button1" runat="server" Text="X" class="closeButton" style='position:absolute;right:2px;top:0px;border-radius: 10px;width:34px;height:25px;padding-right:7px;' OnClientClick="return confirm('Czy na pewno chcesz usunąć tą książkę?');" 
CommandName="Delete" /><br /></div>
                  
                 <div style='float:left;height:50px;width:50px;overflow:hidden;padding-right:5px;'> <asp:Image ID="Image1" runat="server" style='max-height:50px;max-width:50px;' ImageUrl='<%# "/img/"+Eval("id_ksiazki")+"/"+Eval("id_ksiazki")+".jpg" %>' /></div>
        
                     <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     
                      <asp:Label ID="autorLabelimie" runat="server" Text='<%# Eval("imie") %>' /> <asp:Label ID="autorLabelnazwisko" runat="server" Text='<%# Eval("nazwisko") %>' />
                     <br />
                      <asp:Label ID="cenalabel" runat="server" Text='<%# Eval("cena") %>' CssClass="cenaKsiazki" /> <asp:label runat=server ID=x CssClass=cenaKsiazki> zł</asp:label>
                      <br />
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwa_kategorii") %>' />
                      
                      <br>
                      
                      </br>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("opis") %>' />
                     <br />
                     <asp:Button
                         ID="Button2" runat="server" Text="Zapisz" style='width:100%;' class='edytuj_magazyn edytuj_magazyn_save' CommandName="update" />
                     <br />

                     </div>
                 </EditItemTemplate>
                 <ItemStyle VerticalAlign="Top" />
                 <ItemTemplate>

                 
                  <div id="przedmiot"  class='magazyn'>
                 
                 <div class='ak_naglowek' style='position:relative;text-align:left !important;'>
                 <asp:Label ID="ProduktIDLabel" runat="server" class="label_opis_Admin tytul"  style='margin-left:6px;' Text='<%# Eval("id_ksiazki") %>' />
                 <!---<div ID="Label3" runat="server" class="label_opis_Admin tytul"  style='position:absolute;top:3px;margin:auto;margin-left:33%;width:60px !important;text-align:center;border-radius:40px 40px 0 0;' ></div> --->
                 <asp:Button ID="Button1" runat="server" Text="X" class="closeButton" style='position:absolute;right:2px;top:0px;border-radius: 10px;width:34px;height:25px;padding-right:7px;' OnClientClick="return confirm('Czy na pewno chcesz usunąć tą książkę?');" 
CommandName="Delete" /><br /></div>
                  
                 <div style='float:left;height:50px;width:50px;overflow:hidden;padding-right:5px;'> <asp:Image ID="Image1" runat="server" style='max-height:50px;max-width:50px;' ImageUrl='<%# "/img/"+Eval("id_ksiazki")+"/"+Eval("id_ksiazki")+".jpg" %>' /></div>
        
                     <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />
                     
                     <asp:Label ID="autorLabelimie" runat="server" Text='<%# Eval("imie") %>' /> <asp:Label ID="autorLabelnazwisko" runat="server" Text='<%# Eval("nazwisko") %>' />
                     <br />
                      <asp:Label ID="cenalabel" runat="server" Text='<%# Eval("cena") %>' CssClass="cenaKsiazki" /> <asp:label runat=server ID=x CssClass=cenaKsiazki> zł</asp:label>
                      <br />
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwa_kategorii") %>' />
                      
                      <br>
                      
                      </br>
                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("opis") %>' />
                        <br />

                     <asp:Button
                         ID="edycja_magazynu" runat="server" Text="Edytuj" style='width:100%' class='edytuj_magazyn' CommandName="edit" />
                     <br />

                     </div>
                 </ItemTemplate>
             </asp:DataList>
                   <asp:SqlDataSource ID="SqlDataSource_produkty" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:CS %>" 
                       DeleteCommand="DELETE * FROM [Ksiazka] WHERE" 
                       SelectCommand="SELECT k.id_ksiazki, k.id_kategoria, k.cena, k.id_magazynu, k.nazwa, k.opis, k.dostepnosc, kat.nazwa AS nazwa_kategorii, Autor.imie, Autor.nazwisko FROM Ksiazka AS k INNER JOIN Kategorie AS kat ON k.id_kategoria = kat.id_kategoria INNER JOIN Autor_ksiazki ON k.id_ksiazki = Autor_ksiazki.id_ksiazki INNER JOIN Autor ON Autor_ksiazki.id_autor = Autor.id_autor" 
                       
                       
                       
                       UpdateCommand="UPDATE [Ksiazka] SET nazwa =, cena =, id_kategoria =, id_magazynu =, opis =">
                   </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 
                 SelectCommand="SELECT P.id_ksiazki,P.nazwa,P.opis,M.ilosc from [Ksiazka] P,stan_magazynu M where P.id_magazynu=M.id_magazynu" 
                 
                 UpdateCommand="UPDATE Magazyn SET ilosc = @ilosc WHERE (id_magazynu = @ProduktID_org)">
                 <UpdateParameters>
                     <asp:Parameter Name="ilosc"  Type="String" />
                     <asp:Parameter Name="ProduktID_org"  Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         </div>
               </ContentTemplate>
         </asp:UpdatePanel>
    
          

     
         <div id="dodaj_przedmiot" style="box-shadow:0 4px 10px black;border-radius:10px;width:300px;height:215px; position:relative;">
           <div class='a_naglowek' style='border-radius:20px;background:green;color:white;width:20px;text-align:center;position:absolute;right:0px;top:0px;'>+</div>
            <div class='mini_obraz' id=podglad style="float:left;width:100px;height:100px;overflow:hidden; font-size:16px;">
          
            <label id=obraz_admin_up>&nbsp;Brak Obrazu&nbsp;</label>
    <asp:FileUpload ID="FileUploadmin" runat="server" name="plik2" type="file" CssClass='upload_admin' onchange="czytajurl(this);"/>
            </div>
            <div  style="float:left;width:200px;height:115px;overflow:hidden;">

                <table style="width: 100%" id=opis_admin_produkt>
                    <tr>
                        <td>
                            <label class=label_opis_Admin>Nazwa</label>
                            <asp:TextBox  ID="TextBoxnazwa" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class=label_opis_Admin>Autor</label>
                            <asp:DropDownList ID="DropDownListAutor"
                                runat="server" DataSourceID="sql_autorzy" DataTextField="imieNazwisko" 
                                DataValueField="id_autor">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sql_autorzy" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:CS %>" 
                                SelectCommand="SELECT id_autor, imie + ' ' + nazwisko AS imieNazwisko FROM Autor">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <div style='float:left;width:70px;'><label class=label_opis_Admin>Cena</label>
                            <asp:TextBox ID="TextBoxcena" runat="server" style='width:70px;'></asp:TextBox></div>
                            <div style='float:right;width:110px;text-align:right;'><label class=label_opis_Admin style='border-radius:0 20px;'>Kategoria</label>
                                <asp:DropDownList ID="DropDownkat" 
                                    style='margin-right:0px;width:90px;border-radius:10px;' runat="server" 
                                    DataSourceID="SqlDataSource2_dropdownlista" DataTextField="nazwa" 
                                    DataValueField="id_kategoria">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2_dropdownlista" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:CS %>" 
                                    SelectCommand="SELECT * FROM [Kategorie]"></asp:SqlDataSource>
                        </div>
                        </td>

                    </tr>
                </table>

            </div>
                              
                        <asp:Button ID="button_dodaj_produkt" runat="server" class='styl-1' 
                 style='width:100%;border:0px;left:0px;border-radius:7px;bottom:0px;position:absolute;bottom:-2px;' 
                 Text="Dodaj książkę" onclick="buttonDodajKsiazkeClick" 
                         PostBackUrl="~/admin/" />

                <label class=label_opis_Admin style='margin-left:2px;'>Opis</label>  <asp:TextBox ID="text_opis_admin" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>

         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:CS %>" 
             InsertCommand="INSERT INTO Ksiazka(nazwa, cena,id_kategoria, dostepnosc) VALUES (@nazwa,@cena,@id_kategoria, @dostepnosc)" 
             SelectCommand="select TOP 1 * from [Ksiazka]">
             <InsertParameters>
                 <asp:Parameter Name="nazwa" />
                 
                 <asp:Parameter Name="cena" />
                 <asp:Parameter Name="id_kategoria" />

                 <asp:Parameter Name="dostepnosc" />
             </InsertParameters>
         </asp:SqlDataSource>
          </div>
           
               <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
   

         <div id=magazyn_admin runat='server' class='magazyn_admin' style="margin-top:10px;">
             <asp:DataList ID="DataList1_magazyn" runat="server" DataSourceID="DS_magazyn_admin" 
                 RepeatColumns="3" DataKeyField="id_ksiazki" 
                 oneditcommand="DataList1_EditCommand" 
                 onupdatecommand="DataList1_magazyn_UpdateCommand" 
                 RepeatDirection="Horizontal">
                 <EditItemTemplate>
                    <div  class='magazyn edytowany_magazyn'>
                     id:
                     <asp:Label ID="ProduktIDLabel_e" runat="server" Text='<%# Eval("id_ksiazki") %>' />
                     <br />
                     Tytuł:
                     <asp:Label ID="nazwaLabel_e" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />

                     Ilość:
                     <asp:TextBox ID="iloscLabel_e" runat="server" Text='<%# Eval("ilosc") %>' style="width:70px;"/>
                     <br />
                     <asp:Button
                         ID="edycja_magazynu_e" runat="server" Text="Zapisz" style='width:100%' class='edytuj_magazyn edytuj_magazyn_save' CommandName="update" />
                     <br />
  
                     </div>
                 </EditItemTemplate>
                 <ItemTemplate>
                  <div id="przedmiot" class="magazyn">
                     id:
                     <asp:Label ID="ProduktIDLabel" runat="server" Text='<%# Eval("id_ksiazki") %>' />
                     <br />
                     Tytuł:
                     <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                     <br />

                     Ilość:
                     <asp:Label ID="iloscLabel" runat="server" Text='<%# Eval("ilosc") %>' />
                     <br />
                     <asp:Button
                         ID="edycja_magazynu" runat="server" Text="Edytuj" style='width:100%' class='edytuj_magazyn' CommandName="edit" />
                     <br />
  
                     </div>
                 </ItemTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="DS_magazyn_admin" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 
                 SelectCommand="SELECT P.id_ksiazki,P.nazwa,M.ilosc from [Ksiazka] P,[Magazyn] M where P.id_magazynu=M.id_magazynu" 
                 
                 UpdateCommand="UPDATE [Magazyn] SET ilosc = @ilosc WHERE (id_magazynu = @ProduktID_org)">
                 <UpdateParameters>
                     <asp:Parameter Name="ilosc"  Type="String" />
                     <asp:Parameter Name="ProduktID_org"  Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         </div>

                     </ContentTemplate>
        </asp:UpdatePanel>

              <div id=kategorie_admin_menu runat='server' class='buttony_gridview_admin'>
        
                           <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                 BackColor="#EEEEEE" BorderColor="#AAAAAA"
                 CellPadding="2" DataKeyNames="id_kategoria" 
                 DataSourceID="sql_kategorie_admin" ForeColor="Black" GridLines="None" 
                    ShowFooter="True" Width="100%" ShowHeaderWhenEmpty="True">
                 <AlternatingRowStyle BackColor="#dedede" />
                 <Columns>
                     <asp:TemplateField HeaderText="id" InsertVisible="False" 
                         SortExpression="id_kategoria">
                         <EditItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_kategoria") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_kategoria") %>'></asp:Label>
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:Label ID="Label1" runat="server" Text='+'></asp:Label>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="nazwa" SortExpression="nazwa">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazwa") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("nazwa") %>'></asp:Label>
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text=''></asp:TextBox>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="opis" SortExpression="opis">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("opis") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text=''></asp:TextBox>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="obrazek" SortExpression="obrazek">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("obrazek") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label4" runat="server" Text='<%# Bind("obrazek") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Edycja">
                         <EditItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                 CommandName="Update" Text="Aktualizuj" />
                             &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                 CommandName="Cancel" Text="Przerwij" />
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                 CommandName="Edit" Text="Zmień" />
                             &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                 CommandName="Delete" Text="Usuń" />
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:Button ID="insertButtonKategoria" runat="server" CausesValidation="True" OnClick="insertButtonKategoria_Click" 
                                 CommandName="Insert" Text="Dodaj" Width="100%" />
                         </FooterTemplate>
                     </asp:TemplateField>
                 </Columns>
                     <EmptyDataTemplate>
                       <table><tr><td><asp:TextBox ID="TextBox1" runat="server" Text=''></asp:TextBox> </td><td><asp:TextBox ID="TextBox2" runat="server" Text=''></asp:TextBox> </td><td>  
                                 <asp:Button ID="insertButtonKategoria" runat="server" CausesValidation="True" 
                                 CommandName="Insert" Text="Dodaj" Width="100%" OnClick="insertButtonKategoria_Click"  /></td></tr></table>
                      </EmptyDataTemplate>
                 <FooterStyle BackColor="#CCFF99" />
                 <HeaderStyle BackColor="#00aaff" Font-Bold="True" />
                 <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                     HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                 <SortedAscendingCellStyle BackColor="#FAFAE7" />
                 <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                 <SortedDescendingCellStyle BackColor="#E1DB9C" />
                 <SortedDescendingHeaderStyle BackColor="#C2A47B" />
             </asp:GridView>
             <asp:SqlDataSource ID="sql_kategorie_admin" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 DeleteCommand="DELETE FROM [Kategorie] WHERE (id_kategoria = @id_kategoria)" 
                 SelectCommand="SELECT * FROM [Kategorie]" 
                 UpdateCommand="UPDATE [Kategorie] SET nazwa = @nazwa, opis = @opis, obrazek = @obrazek
                 WHERE (id_kategoria = @id_kategoria)"
                 InsertCommand="INSERT INTO [Kategorie] (nazwa,opis) VALUES (@nazwa,@opis)">
                 <DeleteParameters>
                     <asp:Parameter Name="id_kategoria" />
                 </DeleteParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="nazwa" />
                     <asp:Parameter Name="opis" />
                     <asp:Parameter Name="obrazek" />
                 </UpdateParameters>
                 <InsertParameters>
                     <asp:Parameter Name="nazwa" />
                     <asp:Parameter Name="opis" />                 
                 </InsertParameters>
             </asp:SqlDataSource>
         <br />
        </ContentTemplate>
        </asp:UpdatePanel>

    </div>



    <div id=admin_menu_autorzy runat='server' class='buttony_gridview_admin'>
         
                           <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                 BackColor="#EEEEEE" BorderColor="#AAAAAA" 
                 CellPadding="2" DataKeyNames="id_autor" 
                 DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="None" 
                 ShowFooter="True" Width="100%" ShowHeaderWhenEmpty="True">
                 <AlternatingRowStyle BackColor="#dedede" />
                 <Columns>
                     <asp:TemplateField HeaderText="id" InsertVisible="False" 
                         SortExpression="id_autor">
                         <EditItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_autor") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_autor") %>'></asp:Label>
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:Label ID="Label1" runat="server" Text='+'></asp:Label>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Imie" SortExpression="imie">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                         </ItemTemplate>
                         <FooterTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text=''></asp:TextBox>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Nazwisko" SortExpression="nazwisko">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("nazwisko") %>'></asp:Label>
                         </ItemTemplate>
                         <FooterTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text=''></asp:TextBox>
                         </FooterTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Edycja">
                         <EditItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                 CommandName="Update" Text="Aktualizuj" />
                             &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                 CommandName="Cancel" Text="Przerwij" />
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                 CommandName="Edit" Text="Zmień" />
                             &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                 CommandName="Delete" Text="Usuń"  OnClientClick="return confirm('Czy na pewno chcesz usunąć tego autora?');"/>
                         </ItemTemplate>
                         <FooterTemplate>
                             <asp:Button ID="insertButtonAutor" runat="server" CausesValidation="True" OnClick="insertButtonAutor_Click" 
                                 CommandName="Insert" Text="Dodaj" Width="100%" />
                         </FooterTemplate>
                     </asp:TemplateField>
                 </Columns>

                 <FooterStyle BackColor="#CCFF99" />
                 <HeaderStyle BackColor="#00aaff" Font-Bold="True" />
                 <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                     HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                 <SortedAscendingCellStyle BackColor="#FAFAE7" />
                 <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                 <SortedDescendingCellStyle BackColor="#E1DB9C" />
                 <SortedDescendingHeaderStyle BackColor="#C2A47B" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:CS %>" 
                 DeleteCommand="DELETE FROM Autor WHERE (id_autor = @id_autor)" 
                 SelectCommand="SELECT id_autor, imie, nazwisko FROM Autor" 
                 
                    UpdateCommand="UPDATE Autor SET imie = @imie, nazwisko = @nazwisko WHERE (id_autor = @id_autor)" 
                    InsertCommand="INSERT INTO Autor(imie, nazwisko) VALUES (@imie, @nazwisko)">
                 <DeleteParameters>
                     <asp:Parameter Name="id_autor" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="imie" />
                     <asp:Parameter Name="nazwisko" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="imie" />
                     <asp:Parameter Name="nazwisko" />
                     <asp:Parameter Name="id_autor" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         <br />
        </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>
 </div></div>

</asp:Content>


