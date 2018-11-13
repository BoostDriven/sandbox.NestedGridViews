<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NestedGridViewSqlDataSouirce.aspx.cs" Inherits="NestedGridviews.NestedGridView102" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsCustomer" runat="server" ConnectionString='<%$ ConnectionStrings:northwind %>' SelectCommand="SELECT [id], [last_name], [first_name] FROM [customers]"></asp:SqlDataSource>

    <asp:GridView ID="GridView1" Style="position:relative;left:15px;OVERFLOW:auto;width:90%" runat="server" PageSize="4" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="sdsCustomer" AllowPaging="True" RowStyle-VerticalAlign="Top" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    
                    <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString='<%$ ConnectionStrings:northwind %>' SelectCommand="SELECT [id], [order_date], [shipped_date], [payment_type], [ship_city], [ship_state] FROM [orders] WHERE ([customer_id] = @customer_id)">
                        <SelectParameters>
                            <asp:Parameter Name="customer_id" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <img id="toggle" alt="" style="cursor: pointer" src="images/plus.png" />
                   

                    <asp:Panel ID="pnlOrders" runat="server" Style="display:none;">
                        <asp:GridView ID="GridView2" runat="server" PageSize="3" DataSourceID="sdsOrder" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"></asp:BoundField>
                                <asp:BoundField DataField="order_date" HeaderText="order_date" SortExpression="order_date"></asp:BoundField>
                                <asp:BoundField DataField="shipped_date" HeaderText="shipped_date" SortExpression="shipped_date"></asp:BoundField>
                                <asp:BoundField DataField="payment_type" HeaderText="payment_type" SortExpression="payment_type"></asp:BoundField>
                                <asp:BoundField DataField="ship_city" HeaderText="ship_city" SortExpression="ship_city"></asp:BoundField>
                                <asp:BoundField DataField="ship_state" HeaderText="ship_state" SortExpression="ship_state"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                            
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name"></asp:BoundField>
            <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name"></asp:BoundField>
        </Columns>
    </asp:GridView>

   
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
     
            $("[src*=plus]").live("click", function () {
                $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
                $(this).attr("src", "images/minus.png");
            });
            $("[src*=minus]").live("click", function () {
                $(this).attr("src", "images/plus.png");
                $(this).closest("tr").next().remove();
            });
  
            
    </script>
     
</asp:Content>