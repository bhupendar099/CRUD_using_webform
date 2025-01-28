<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="practiceWebformApplication.UserForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
            <table >
                <tr>
                    <td>User Name</td>
                    <td> <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                    <asp:RequiredFieldValidator ID="vrfname" runat="server" ControlToValidate="txtname" ValidationGroup="aa" ErrorMessage=" Enter Name " Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revname" runat="server" ValidationGroup="aa" ErrorMessage="name should be alphabetic" ControlToValidate="txtname" Display="None" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                </tr>

                 <tr>
     <td>User Age</td>
     <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
      <asp:RequiredFieldValidator ID="rvfage" runat="server" ControlToValidate="txtage" ValidationGroup="aa" ErrorMessage=" Enter Age " Display="None"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revage" runat="server" ValidationGroup="aa" ErrorMessage="age should be numeric" ControlToValidate="txtage" Display="None" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
 </tr>

                 <tr>
     <td>User Number</td>
     <td><asp:TextBox ID="txtnumber" runat="server"></asp:TextBox></td>
       <asp:RequiredFieldValidator ID="rvfnumber" runat="server" ControlToValidate="txtnumber" ValidationGroup="aa" ErrorMessage=" Enter Number " Display="None"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revnumber" runat="server" ValidationGroup="aa" ErrorMessage="Number should be numeric" ControlToValidate="txtnumber" Display="None" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
 </tr>

      <tr>
    <td>User Gender</td>
    <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3" >
        <asp:ListItem Text="Male" Value ="1"></asp:ListItem>
         <asp:ListItem Text="female" Value ="2"></asp:ListItem>
         <asp:ListItem Text="other" Value ="3"></asp:ListItem>
        </asp:RadioButtonList></td>
<asp:RequiredFieldValidator ID="rfvgender" runat="server" ControlToValidate="rblgender" ValidationGroup="aa" ErrorMessage=" Select Gender " Display="None"></asp:RequiredFieldValidator>
</tr>

       <tr>
    <td>User Country</td>
    <td><asp:DropDownList ID="ddlcounrty" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcounrty_SelectedIndexChanged" >
        
         </asp:DropDownList></td>
<asp:RequiredFieldValidator ID="rfvcountry" runat="server" ControlToValidate="ddlcounrty" ValidationGroup="aa" ErrorMessage="Select Counrty " Display="None"></asp:RequiredFieldValidator>
</tr>

      <tr>
    <td>User State</td>
    <td><asp:DropDownList ID="ddlstate" runat="server"   >
        
         </asp:DropDownList></td>
<asp:RequiredFieldValidator ID="rfvstate" runat="server" ControlToValidate="ddlstate" ValidationGroup="aa" ErrorMessage=" Select State " Display="None"></asp:RequiredFieldValidator>
 </tr>

                 <tr>
     <td></td>
     <td><asp:Button ID="btnsubmit" Text="Submit" runat="server" ValidationGroup="aa" onclick="btnsubmit_Click" ></asp:Button></td>
 </tr>

    <tr>
    <td></td>
    <td><asp:GridView ID="Gvusers"  runat="server" AutoGenerateColumns="false" OnRowCommand="Gvusers_RowCommand" style="background-color:slategray" >
        <Columns>
            <asp:TemplateField HeaderText="User ID">
                <ItemTemplate>
                    <%#Eval("userID")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <%#Eval("userName") %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="User Age">
    <ItemTemplate>
        <%#Eval("userAge") %>
    </ItemTemplate>
</asp:TemplateField>

            <asp:TemplateField HeaderText="User Number">
    <ItemTemplate>
        <%#Eval("userNumber") %>
    </ItemTemplate>
</asp:TemplateField>

  <asp:TemplateField HeaderText="User Gender">
    <ItemTemplate>
        <%#Eval ("userGender").ToString()=="1" ? "male":Eval("userGender").ToString()=="2" ? "female":"other" %>
    </ItemTemplate>
</asp:TemplateField>

 <asp:TemplateField HeaderText="User Country">
    <ItemTemplate>
        <%#Eval("Cname") %>
    </ItemTemplate>
</asp:TemplateField>

   <asp:TemplateField HeaderText="User State">
    <ItemTemplate>
        <%#Eval("Sname") %>
    </ItemTemplate>
</asp:TemplateField>

      <asp:TemplateField HeaderText="DELETE">
    <ItemTemplate>
        <asp:LinkButton ID="btndelete" runat="server"  CommandName="A" CommandArgument='<%#Eval("userID")%>' Text="Delete"></asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>

           <asp:TemplateField HeaderText="Edit">
    <ItemTemplate>
        <asp:LinkButton ID="btnedit" runat="server" CommandName="B" CommandArgument='<%#Eval("userID")%>' Text="Edit"></asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>

           
        </Columns>
        </asp:GridView></td>
</tr>
          
            </table>
            <asp:ValidationSummary ID="popup" runat="server" ValidationGroup="aa" ShowMessageBox="true" ShowSummary="false" />
        </div>
    </form>
</body>
</html>
</center>
