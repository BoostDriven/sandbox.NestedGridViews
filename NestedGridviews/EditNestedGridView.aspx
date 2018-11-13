<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditNestedGridView.aspx.cs" Inherits="NestedGridviews.EditNestedGridView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:GridView ID="gvMaster" 
                      runat="server" 
                      AutoGenerateColumns="False" 
                      DataKeyNames="id" 
                      DataSourceID="SqlDataSource1"
                      EnableModelValidation="true"
                      AllowPaging="true"
                      AllowSorting="true"
                      BackColor="#F1F1F1"
                      Style="z-index: 101;left:8px;position:relative;top:32px"
                      ShowFooter="true"
                      Font-Size="Small"
                      Font-Names="Verdana"
                      GridLines="None" 
            OnRowCommand="gvMaster_RowCommand" 
            OnRowDataBound="gvMaster_RowDataBound" 
            OnRowDeleted="gvMaster_RowDeleted" 
            OnRowDeleting="gvMaster_RowDeleting"
             OnRowUpdated="gvMaster_RowUpdated" 
            OnRowUpdating="gvMaster_RowUpdating">
            <RowStyle BackColor="Gainsboro" />
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle BackColor="#0083C1" ForeColor="White" />
            <FooterStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="javascript:expandCollapse('div<%# Eval("id") %>', 'one');">
                            <img id="imgdiv<%# Eval("id") %>"
                                 alt="Click to show/hide Orders for Customer <%# Eval("id") %>" 
                                 width="9px"
                                 border="0"
                                 src="images\plus.gif" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CustomerID" SortExpression="id">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCustomerID" runat="server" Text='<%# Eval("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCustomerID" Text='' runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CompanyName" SortExpression="CompanyName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCompanyName" runat="server" Text='<%# Bind("company") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("company") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCompanyName" Text='' runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FirstName" SortExpression="First_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFirstName" Text='' runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName" SortExpression="Last_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastNamee" runat="server" Text='<%# Eval("last_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtLastNamee" Text='' runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address1">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address1") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddress" Text='' runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkDeleteCust" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkAddCust" CommandName="AddCustomer" runat="server">Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("id") %>" style="display:none;position:relative;left:15px;OVERFLOW:auto;WIDTH:97%">
                                    <asp:GridView ID="gvDetails"
                                        runat="server"
                                        AllowPaging="true"
                                        AllowSorting="true"
                                        BackColor="White"
                                        Width="100%"
                                        Font-Size="X-Small"
                                        AutoGenerateColumns="false"
                                        Font-Names="Verdana"
                                        ShowFooter="true"
                                        BorderStyle="Double"
                                        BorderColor="#0083C1"
                                        GridLines="None" 
                                        DataKeyNames="id">

                                                  <RowStyle BackColor="Gainsboro" />
                                                  <AlternatingRowStyle BackColor="White" />
                                                  <HeaderStyle BackColor="#0083C1" ForeColor="White" />
                                                  <FooterStyle BackColor="White" />
                                                  <Columns>
                                                      <asp:TemplateField HeaderText="Order ID" SortExpression="id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOrderID" Text='<%# Eval("id") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="lblOrderID" Text='<%# Eval("id") %>' runat="server"></asp:Label>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ship Fee" SortExpression="shipping_fee">
                                                        <ItemTemplate><%# Eval("shipping_fee") %></ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtShipFee" Text='<%# Eval("shipping_fee") %>' runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtShipFee" Text='' runat="server"></asp:TextBox>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Shipper Name" SortExpression="ship_name">
                                                        <ItemTemplate><%# Eval("ship_name") %></ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtShipperName" Text='<%# Eval("ship_name") %>' runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtShipperName" Text='' runat="server"></asp:TextBox>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ship Address" SortExpression="ship_address1">
                                                        <ItemTemplate><%# Eval("ship_address1")%></ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtShipAddress" Text='<%# Eval("ship_address1")%>' runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtShipAddress" Text='' runat="server"></asp:TextBox>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                                                    <asp:TemplateField HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="linkDeleteCust" CommanName="Delete" runat="server">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:LinkButton ID="linkAddOrder" CommandName="AddOrder" runat="server">Add</asp:LinkButton>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                  </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Northwind %>' SelectCommand="SELECT [id], [company], [first_name], [last_name], [Address1] FROM [Customers] ORDER BY [id]"></asp:SqlDataSource>
    
    <script type="text/javascript">
        function expandCollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == 'none') {
                div.style.display = 'block';
                if (row == 'alt') {
                    img.src = 'images\\minus.gif';
                } else {
                    img.src = 'images\\minus.gif';
                }
                img.alt = 'Close to view other Customers';
            } else {
                div.style.display = 'none';
                if (row == 'alt') {
                    img.src = 'images\\plus.gif';
                } else {
                    img.src = 'images\\plus.gif';
                }
                img.alt = 'Expand to show Orders';
            }
        }
    </script>
</asp:Content>
