<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NestedGridViewAdo.aspx.cs" Inherits="NestedGridviews.NestedGridViewAdo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <asp:UpdatePanel ID="pnlCustomers" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvCustomers" 
                        runat="server" 
                        AutoGenerateColumns="false" 
                        CssClass="Grid"
                        DataKeyNames="id"
                        AllowPaging="true"
                        ShowFooter="true"
                        PageSize="6"
                        Style="z-index: 101;left:8px;position:relative;top:32px;"
                        OnRowDataBound="OnRowDataBound"
                        OnPageIndexChanging="gvCustomers_PageIndexChanging">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="javascript:expandCollapse('div<%# Eval("id") %>', 'one');">
                                <img id="imgdiv<%# Eval("id") %>"
                                        alt="Click to show/hide Orders for Customer <%# Eval("id") %>" 
                                        style="cursor: pointer"
                                        src="images\plus.png" />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="200px" DataField="first_name" HeaderText="First Name" />
                    <asp:BoundField ItemStyle-Width="200px" DataField="last_name" HeaderText="Last Name" />
                    <asp:BoundField ItemStyle-Width="200px" DataField="city" HeaderText="City" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <tr>
                                <td colspan="100%">
                                    <div id="div<%# Eval("id") %>" class="child" style="position:relative;left:35px;OVERFLOW:auto;">
                                        <asp:UpdatePanel ID="upDetails" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvOrders" 
                                                                AllowPaging="true" 
                                                            OnPageIndexChanging="gvOrders_PageIndexChanging" 
                                                            PageSize="6" 
                                                            runat="server" 
                                                            AutoGenerateColumns="false"
                                                            CssClass="ChildGrid">
                                                    <Columns>
                                                        <asp:BoundField ItemStyle-Width="150px" DataField="id" HeaderText="Order Id" />
                                                        <asp:BoundField ItemStyle-Width="150px" DataField="order_date" HeaderText="Date" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>       
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            hideNest();
        });

        function hideNest() {
            $('.child').hide();
        }

        function expandCollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == 'none') {
                div.style.display = 'block';
                if (row == 'alt') {
                    img.src = 'images\\minus.png';
                } else {
                    img.src = 'images\\minus.png';
                }
                img.alt = 'Close to view other Customers';
                
                //$(img).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().next().html() + "</td></tr>")
            } else {
                div.style.display = 'none';
                if (row == 'alt') {
                    img.src = 'images\\plus.png';
                } else {
                    img.src = 'images\\plus.png';
                }
                img.alt = 'Expand to show Orders';
                //$(div).closest("tr").next().remove();
            }
        }

    </script>
</asp:Content>