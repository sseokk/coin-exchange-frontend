<!--
***************************************************************************** 
* Copyright 2016 Aurora Solutions 
* 
*    http://www.aurorasolutions.io 
* 
* Aurora Solutions is an innovative services and product company at 
* the forefront of the software industry, with processes and practices 
* involving Domain Driven Design(DDD), Agile methodologies to build 
* scalable, secure, reliable and high performance products.
* 
* Coin Exchange is a high performance exchange system specialized for
* Crypto currency trading. It has different general purpose uses such as
* independent deposit and withdrawal channels for Bitcoin and Litecoin,
* but can also act as a standalone exchange that can be used with
* different asset classes.
* Coin Exchange uses state of the art technologies such as ASP.NET REST API,
* AngularJS and NUnit. It also uses design patterns for complex event
* processing and handling of thousands of transactions per second, such as
* Domain Driven Designing, Disruptor Pattern and CQRS With Event Sourcing.
* 
* Licensed under the Apache License, Version 2.0 (the "License"); 
* you may not use this file except in compliance with the License. 
* You may obtain a copy of the License at 
* 
*    http://www.apache.org/licenses/LICENSE-2.0 
* 
* Unless required by applicable law or agreed to in writing, software 
* distributed under the License is distributed on an "AS IS" BASIS, 
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
* See the License for the specific language governing permissions and 
* limitations under the License. 
*****************************************************************************
-->


<div class="slider" id="tradedetail-wrap" ng-controller="TradeDetailsController">
    <div class="transfer">

        <div class="row" ng-hide="tradeDetailsLoaded">
            <p style="text-align: center">
                <i class="icon-spinner icon-spin icon-large icon-5x"></i> <br>
                Loading...
            </p>
        </div>

<div class="frame frame-active" style="width: 950px;" ng-show="tradeDetailsLoaded">
    <div>
    <div class="clearfix vmarg20bot">
        <h4 class="title pull-left" ng-bind-template="Trade {{tradeDetails.TradeId}}"></h4>
        <div class="pull-right">
            <button class="btn btn-small back" ng-click='goToUrl("/account/trade/trades")'>« Back</button>
        </div>
    </div>
    <div class="row stats-dots-wrap">
        <div class="span6">
            <div class="hpad20right">
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Order</td>
                        <td class="dots"></td> <td class="nw" ng-click="setOrderIdAsUrlParameter(tradeDetails.Order.OrderId)" ng-class="{active: ('account.trade.showOrderDetails' | routeSegmentStartsWith)}">
                            <a href="{{locationPath}}">{{tradeDetails.Order.OrderId | limitTo : 8}}</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign" ng-bind-template="{{tradeDetails.Order.Side}} {{tradeDetails.Order.Volume}} {{tradeDetails.Order.CurrencyPair}} @ {{tradeDetails.Order.Type}}"></td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Executed</td>
                        <td class="dots"></td>
                        <td ng-bind="tradeDetails.ExecutionDateTime"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">Date/time of trade execution.</td>
                    </tr></tbody></table>
                <table class="stats-dots">
                    <tbody><tr>
                        <td class="k">Currency</td>
                        <td class="dots"></td>
                        <td ng-bind="tradeDetails.Order.CurrencyPair"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">Base currency / quote currency.</td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Order Type</td>
                        <td class="dots"></td>
                        <td ng-bind-template="{{tradeDetails.Order.Side}}/{{tradeDetails.Order.Type}}"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">&nbsp;</td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Leverage</td>
                        <td class="dots"></td>
                        <td>none</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">&nbsp;</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="span6">
            <div class="hpad20left">
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Price</td>
                        <td class="dots"></td>
                        <td class="mono" ng-bind="tradeDetails.ExecutionPrice"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">Quote price the trade was executed at.</td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Volume</td>
                        <td class="dots"></td>
                        <td class="mono" ng-bind="tradeDetails.Volume"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">Total currency amount traded.</td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Fee</td>
                        <td class="dots"></td>
                        <td class="mono">---</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">Fee charged for this trade.</td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Cost</td>
                        <td class="dots">

                        </td> <td class="mono" ng-bind-template="{{tradeDetails.ExecutionPrice * tradeDetails.Volume}}"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">Total cost of the trade.</td>
                    </tr>
                    </tbody>
                </table>
                <table class="stats-dots">
                    <tbody>
                    <tr>
                        <td class="k">Status</td>
                        <td class="dots"></td>
                        <td ng-bind="tradeDetails.Order.Status"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="control-hint ralign">&nbsp;</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="hmarg20top">
        <h4 class="title">Trade Ledger Entries</h4>
        <div id="DataTables_Table_17_wrapper" class="dataTables_wrapper form-inline" role="grid">
            <div class="dataTables_table_wrapper">
                <table class="table table-hover table-striped dataTable table-ledger" id="DataTables_Table_17" aria-describedby="DataTables_Table_17_info">
                    <thead>
                    <tr role="row">
                        <th class="lalign nw sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-label="Ledger ID: activate to sort column ascending" style="width: 85px;">Ledger ID</th><th class="lalign sorting_desc" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-sort="descending" aria-label="Date: activate to sort column ascending">Date</th><th class="lalign sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-label="Type: activate to sort column ascending">Type</th><th class="lalign sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-label="Currency: activate to sort column ascending">Currency</th><th class="ralign sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-label="Amount: activate to sort column ascending">Amount</th><th class="ralign sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-label="Fee: activate to sort column ascending">Fee</th><th class="ralign sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_17" rowspan="1" colspan="1" aria-label="Balance: activate to sort column ascending">Balance</th></tr> </thead>  <tbody role="alert" aria-live="polite" aria-relevant="all"><tr id="L3TMAK-UIDZU-3PMC5K" class="odd"><td class="nw"></td><td class=""></td><td class=""></td><td class=""></td><td class="ralign neg"><div class="textAlignDecimal"><span></span><span style="width: 7px;"></span><span style="width: 35px;"></span></div></td><td class="ralign"><div class="textAlignDecimal"><span></span><span style="width: 7px;"></span><span style="width: 35px;"></span></div></td><td class="ralign"><div class="textAlignDecimal"><span></span><span style="width: 7px;"></span><span style="width: 35px;"></span></div></td></tr><tr id="LJLX37-HBX7T-5BMVLM" class="even"><td class="nw"></td><td class=""></td><td class=""></td><td class=""></td><td class="ralign"><div class="textAlignDecimal"><span></span><span style="width: 7px;"></span><span style="width: 35px;"></span></div></td><td class="ralign"><div class="textAlignDecimal"><span></span><span style="width: 7px;"></span><span style="width: 35px;"></span></div></td><td class="ralign"><div class="textAlignDecimal"><span></span><span style="width: 7px;"></span><span style="width: 35px;"></span></div></td></tr></tbody></table></div><div><div class="pull-left"><div class="dataTables_info" id="DataTables_Table_17_info">No Ledger Entries</div></div><div class="pull-right"><div class="dataTables_paginate paging_bootstrap pagination"><ul><li class="disabled"><a href="javascript: void(0);">‹</a></li><li class="disabled"><a href="javascript: void(0);">›</a>
        </li>
        </ul>
        </div>
        </div>
            <div class="clearfix"></div>
        </div>
        </div>
    </div>
</div>
</div>
</div>
</div>