<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="konto.aspx.cs" Inherits="Ksiegarnia.user.konto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=zawartosc>
  <div class=formularz>
  <div style='width:500px;margin:Auto;margin-top:5px;margin-bottom:5px;background:black;border-radius:13px;color:#aaa;padding:8px;'>
    <span style="font-size:12px;padding-left:100px;">Edycja konta, tutaj możesz zmienić dane swojego konta</span>
    <div style="margin:5px;">
      <asp:SqlDataSource ID="moje_konto" runat="server" 
          ConnectionString="<%$ ConnectionStrings:CS %>" 
          
          SelectCommand='SELECT id_user, id_zamowienia, imie, nazwisko, login, haslo, adres, mail, uprawnienia FROM [User] WHERE (login = @login)' UpdateCommand="UPDATE uzytkownicy SET imie =@imie, mail =@mail , nazwisko =@nazwisko , login =@login, haslo =@haslo
WHERE login = @login">
          <SelectParameters>
              <asp:SessionParameter Name="login" SessionField="login" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="imie" />
              <asp:Parameter Name="mail" />
              <asp:Parameter Name="nazwisko" />
              <asp:Parameter Name="login" />
              <asp:Parameter Name="haslo" />
          </UpdateParameters>
      </asp:SqlDataSource>

      <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
          DataKeyNames="id_user" DataSourceID="moje_konto" ForeColor="#ffffff" 
          onitemupdated="FormView1_ItemUpdated" onitemupdating="FormView1_ItemUpdating">
          <EditItemTemplate>
              imie:
              <asp:TextBox ID="imieTextBox" runat="server" Text='<%# Bind("imie") %>' />
              <br />
              nazwisko:
              <asp:TextBox ID="nazwiskoTextBox" runat="server" 
                  Text='<%# Bind("nazwisko") %>' />
              <br />
              mail:
              <asp:TextBox ID="mailTextBox" runat="server" Text='<%# Bind("mail") %>' />
              <br />
              login:
              <asp:TextBox ID="loginTextBox" runat="server" Text='<%# Bind("login") %>' />
              <br />
              haslo:
              <asp:TextBox ID="hasloTextBox" runat="server" Text='<%# Bind("haslo") %>' />
              <br />
              <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                  CommandName="Update" Text="Zapisz" />
              &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                  CausesValidation="False" CommandName="Cancel" Text="Przerwij" />
          </EditItemTemplate>
          <EditRowStyle BackColor="#CCCCCC" />
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <ItemTemplate>
          <div >
              Login:
              <asp:Label ID="loginLabel" runat="server" Text='<%# Bind("login") %>' />
              <br />
              Imie:
              <asp:Label ID="imieLabel" runat="server" Text='<%# Bind("imie") %>' />
              <br />
              Nazwisko:
              <asp:Label ID="nazwiskoLabel" runat="server" Text='<%# Bind("nazwisko") %>' />
              <br />
              E-mail:
              <asp:Label ID="mailLabel" runat="server" Text='<%# Bind("mail") %>' />
              <br />
              haslo:
              <asp:Label ID="hasloLabel" runat="server" Text='<%# Bind("haslo") %>' />
              <br />
              <asp:Button ID="EdytujButton" runat="server" Text="Edytuj Dane" 
                  CommandName="Edit" style="border-radius:8px;padding:3px;background: rgb(247,251,252);
background: -moz-linear-gradient(top,  rgba(247,251,252,1) 0%, rgba(217,237,242,1) 40%, rgba(173,217,228,1) 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(247,251,252,1)), color-stop(40%,rgba(217,237,242,1)), color-stop(100%,rgba(173,217,228,1)));
background: -webkit-linear-gradient(top,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%);
background: -o-linear-gradient(top,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%);
background: -ms-linear-gradient(top,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%);
background: linear-gradient(to bottom,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7fbfc', endColorstr='#add9e4',GradientType=0 );
" />

              </div>
          </ItemTemplate>
          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

      </asp:FormView>
             </div>
         </div>
      </div>
 </div>
</asp:Content>
