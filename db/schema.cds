namespace com.am.armp.hrrequest;

type Gender : String enum {
    male;
    female;
    non_binary = 'non-binary';
}

entity ExternalEmployee {
    key Amei             : String(8);
        FirstName        : String(25);
        LastName         : String(25);
        EmplStatus       : String(20);
        EmplStatusCrit   : Int32;
        BirthDate        : DateTime;
        Nationality      : String;
        Gender           : Gender;
        PersonnelArea    : String(4);
        PassportNumber   : String(10);
        Exactmatch       : Boolean;
        MultipleSupplier : Boolean;
        Vendor           : String(10);
        Name             : String(35);
        FunctionLevel    : String(2);
        // AssExtEmpSupCnt  : Association to SupplierContract
        //                        on SupplierContract.Pern AssExtEmpMatchAmei :
        // Association
        // to MatchAmei on MatchAmei.Amei = $self.Amei;
}

// Gender is 1 - Male or 2 - Female
entity SupplierContract {
    key Pernr         : String(8);
    key Vendor        : String(10);
    key StartDate     : DateTime;
        Name          : String(35);
        EndDate       : DateTime;
        Active        : Int32;
        FunctionLevel : String(2);
        Persa         : String(4);
        EndContract   : Boolean;
}

entity Supplier {
    key Vendor : String(10);
        Name   : String(35);
}

entity PersonnelArea {
    key PaCode : String(4);
        PaName : String(30);
}

entity Nationality {
    key NatioCode : String(3);
        NatioName : String(15);
}

entity Request {
    key RequestId         : String(10);
        Amei              : String(8);
        StartDate         : DateTime;
        ReasError         : String;
        FunctionLevel     : String(2);
        FirstName         : String(25);
        Supplier          : String(10);
        Name              : String(35);
        ContractStartDate : DateTime;
        LastName          : String(25);
        ContractEndDate   : DateTime;
        PersonnelArea     : String(4);
        Action            : String(1);
        Sender            : String(12);
        CreationDate      : DateTime;
        InputStatus       : String(1);
        Statuscriticality : Int16;
        Approved          : Boolean;
        Rejected          : Boolean;
        RejectionReason   : String;
        WarningReason     : String;
        Confirmed         : Boolean;
        ProcessStat       : String(1);
        ProcessStatCritic : Int16;
        // AssReqError       : Association to RequestError
        //                         on RequestError.RequestId = $self.RequestId;
        // AssReqExtEmp      : Association to RequestExternalEmployee
        //                         on RequestExternalEmployee.RequestId = $self.RequestId;
}

entity File {
    key ObjId        : String(17);
        Mimetype     : String(128);
        Content      : Binary;
        ObjDescr     : String(50);
        // AssFileReq   : Association to Request
        //                    on Request.RequestId = $self.RequestId;
        // AssFileError : Association to RequestError
        //                    on RequestError.RequestId = $self.RequestId;
}

entity Error {
    key Type      : String(1);
    key Id        : String(20);
    key Number    : String(3);
        Message   : String(220);
        LogNo     : String(20);
        LogMsgNo  : String(6);
        MessageV1 : String(50);
        MessageV2 : String(50);
        MessageV3 : String(50);
        MessageV4 : String(50);
        Parameter : String(32);
        Row       : String(11);
        Field     : String(30);
        System    : String(10);
}

entity MatchAmei {
    key Amei          : String(8);
        FirstName     : String(25);
        LastName      : String(25);
        EmplStatus    : String(20);
        PersonnelArea : String(4);
        Vendor        : String(10);
        Name          : String(35);
        FunctionLevel : String(2);
}

entity EmployeeStat {
    key Sprsl : String(2);
    key Statn : String(1);
    key Statv : String(1);
        Text1 : String(40);
}


// Gender
// options {
// 1 - Male
// 2 - Female
// }
// create structured type and assing the description
// create a function to get the description
// create a function to get the value

// <EntityType Name="ExternalEmployee" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="Amei"/>
// 				</Key>
// 				<Property Name="Amei" Type="Edm.String" Nullable="false" MaxLength="8" sap:unicode="false" sap:label="AMEI"/>
// 				<Property Name="FirstName" Type="Edm.String" Nullable="false" MaxLength="25" sap:unicode="false" sap:label="First name"/>
// 				<Property Name="LastName" Type="Edm.String" Nullable="false" MaxLength="25" sap:unicode="false" sap:label="Last name"/>
// 				<Property Name="EmplStatus" Type="Edm.String" Nullable="false" MaxLength="20" sap:unicode="false" sap:label="Employment" sap:updatable="false"/>
// 				<Property Name="EmplStatusCrit" Type="Edm.Int32" Nullable="false" sap:unicode="false" sap:label="Employee status criticality" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="BirthDate" Type="Edm.DateTime" Precision="7" sap:unicode="false" sap:label="Birth date" sap:updatable="false"/>
// 				<Property Name="Nationality" Type="Edm.String" Nullable="false" MaxLength="15" sap:unicode="false" sap:label="Nationality" sap:updatable="false"/>
// 				<Property Name="Gender" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Gender" sap:updatable="false"/>
// 				<Property Name="PersonnelArea" Type="Edm.String" Nullable="false" MaxLength="4" sap:unicode="false" sap:label="Main PA" sap:updatable="false"/>
// 				<Property Name="PassportNumber" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Passaport Number" sap:updatable="false"/>
// 				<Property Name="Exactmatch" Type="Edm.Boolean" Nullable="false" sap:unicode="false" sap:label="Exact match" sap:updatable="false"/>
// 				<Property Name="MultipleSupplier" Type="Edm.Boolean" Nullable="false" sap:unicode="false" sap:label="Multiple supplier" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Vendor" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Supplier" sap:updatable="false"/>
// 				<Property Name="Name" Type="Edm.String" Nullable="false" MaxLength="35" sap:unicode="false" sap:label="Name" sap:updatable="false"/>
// 				<Property Name="FunctionLevel" Type="Edm.String" Nullable="false" MaxLength="2" sap:unicode="false" sap:label="Function level" sap:updatable="false"/>
// 				<NavigationProperty Name="AssExtEmpSupCnt" Relationship="ARMP.HR_MANAGEMENT_SRV.AssExtEmpSupCnt" FromRole="FromRole_AssExtEmpSupCnt" ToRole="ToRole_AssExtEmpSupCnt"/>
// 				<NavigationProperty Name="AssExtEmpMatchAmei" Relationship="ARMP.HR_MANAGEMENT_SRV.AssExtEmpMatchAmei" FromRole="FromRole_AssExtEmpMatchAmei" ToRole="ToRole_AssExtEmpMatchAmei"/>
// 			</EntityType>
// 			<EntityType Name="SupplierContract" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="Pernr"/>
// 					<PropertyRef Name="Vendor"/>
// 					<PropertyRef Name="StartDate"/>
// 				</Key>
// 				<Property Name="Pernr" Type="Edm.String" Nullable="false" MaxLength="8" sap:unicode="false" sap:label="Personnel No."/>
// 				<Property Name="Vendor" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Supplier"/>
// 				<Property Name="Name" Type="Edm.String" Nullable="false" MaxLength="35" sap:unicode="false" sap:label="Name"/>
// 				<Property Name="StartDate" Type="Edm.DateTime" Nullable="false" Precision="7" sap:unicode="false" sap:label="Start Date"/>
// 				<Property Name="EndDate" Type="Edm.DateTime" Precision="7" sap:unicode="false" sap:label="End Date"/>
// 				<Property Name="Active" Type="Edm.Int32" Nullable="false" sap:unicode="false" sap:label="Active" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="FunctionLevel" Type="Edm.String" Nullable="false" MaxLength="2" sap:unicode="false" sap:label="Function level"/>
// 				<Property Name="Persa" Type="Edm.String" Nullable="false" MaxLength="4" sap:unicode="false" sap:label="Personnel area"/>
// 				<Property Name="EndContract" Type="Edm.Boolean" Nullable="false" sap:unicode="false" sap:label="End Contract" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<EntityType Name="Supplier" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="Vendor"/>
// 				</Key>
// 				<Property Name="Vendor" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Supplier" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Name" Type="Edm.String" Nullable="false" MaxLength="35" sap:unicode="false" sap:label="Name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<EntityType Name="PersonnelArea" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="PaCode"/>
// 				</Key>
// 				<Property Name="PaCode" Type="Edm.String" Nullable="false" MaxLength="4" sap:unicode="false" sap:label="Personnel area" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="PaName" Type="Edm.String" Nullable="false" MaxLength="30" sap:unicode="false" sap:label="Name 1" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<EntityType Name="Nationality" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="NatioCode"/>
// 				</Key>
// 				<Property Name="NatioCode" Type="Edm.String" Nullable="false" MaxLength="3" sap:unicode="false" sap:label="Country/Reg." sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="NatioName" Type="Edm.String" Nullable="false" MaxLength="15" sap:unicode="false" sap:label="Nationality" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<EntityType Name="Request" sap:label="Request" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="RequestId"/>
// 				</Key>
// 				<Property Name="Amei" Type="Edm.String" Nullable="false" MaxLength="8" sap:unicode="false" sap:label="AMEI" sap:creatable="false"/>
// 				<Property Name="StartDate" Type="Edm.DateTime" Nullable="false" Precision="7" sap:unicode="false" sap:label="Start Date" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="ReasError" Type="Edm.String" Nullable="false" sap:unicode="false" sap:label="Error Reason" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="FunctionLevel" Type="Edm.String" Nullable="false" MaxLength="2" sap:unicode="false" sap:label="Function level" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="RequestId" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Request ID" sap:creatable="false"/>
// 				<Property Name="FirstName" Type="Edm.String" Nullable="false" MaxLength="25" sap:unicode="false" sap:label="First name" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="Supplier" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Supplier" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="Name" Type="Edm.String" Nullable="false" MaxLength="35" sap:unicode="false" sap:label="Name" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="ContractStartDate" Type="Edm.DateTime" Precision="7" sap:unicode="false" sap:label="Start Date" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="LastName" Type="Edm.String" Nullable="false" MaxLength="25" sap:unicode="false" sap:label="Last name" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="ContractEndDate" Type="Edm.DateTime" Precision="7" sap:unicode="false" sap:label="End Date" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="PersonnelArea" Type="Edm.String" Nullable="false" MaxLength="4" sap:unicode="false" sap:label="Main PA" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="Action" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Request action" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="Sender" Type="Edm.String" Nullable="false" MaxLength="12" sap:unicode="false" sap:label="User Name" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="CreationDate" Type="Edm.DateTime" Precision="7" sap:unicode="false" sap:label="Creation Date" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="InputStatus" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Input Status" sap:creatable="false"/>
// 				<Property Name="Statuscriticality" Type="Edm.Int16" Nullable="false" sap:unicode="false" sap:label="Single-Character Flag" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="Approved" Type="Edm.Boolean" Nullable="false" sap:unicode="false" sap:label="TRUE" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="Rejected" Type="Edm.Boolean" Nullable="false" sap:unicode="false" sap:label="TRUE" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="RejectionReason" Type="Edm.String" Nullable="false" sap:unicode="false" sap:label="Rejection Reason" sap:creatable="false" sap:updatable="false" sap:filterable="false"/>
// 				<Property Name="WarningReason" Type="Edm.String" Nullable="false" sap:unicode="false" sap:label="Warning/Error Reason" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="Confirmed" Type="Edm.Boolean" Nullable="false" sap:unicode="false" sap:label="TRUE" sap:creatable="false" sap:filterable="false"/>
// 				<Property Name="ProcessStat" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Process Status" sap:creatable="false" sap:updatable="false"/>
// 				<Property Name="ProcessStatCritic" Type="Edm.Int16" Nullable="false" sap:unicode="false" sap:label="Single-Character Flag" sap:creatable="false" sap:updatable="false"/>
// 				<NavigationProperty Name="AssReqError" Relationship="ARMP.HR_MANAGEMENT_SRV.AssReqError" FromRole="FromRole_AssReqError" ToRole="ToRole_AssReqError"/>
// 				<NavigationProperty Name="AssReqExtEmp" Relationship="ARMP.HR_MANAGEMENT_SRV.AssReqExtEmp" FromRole="FromRole_AssReqExtEmp" ToRole="ToRole_AssReqExtEmp"/>
// 			</EntityType>
// 			<EntityType Name="File" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="ObjId"/>
// 				</Key>
// 				<Property Name="ObjId" Type="Edm.String" Nullable="false" MaxLength="17" sap:unicode="false" sap:label="SAPoffice: ID of a SAPoffice object" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Mimetype" Type="Edm.String" Nullable="false" MaxLength="128" sap:unicode="false" sap:label="MIME type" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Content" Type="Edm.Binary" Nullable="false" sap:unicode="false" sap:label="Binary String" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="ObjDescr" Type="Edm.String" Nullable="false" MaxLength="50" sap:unicode="false" sap:label="Title" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<NavigationProperty Name="AssFileReq" Relationship="ARMP.HR_MANAGEMENT_SRV.AssFileReq" FromRole="FromRole_AssFileReq" ToRole="ToRole_AssFileReq"/>
// 				<NavigationProperty Name="AssFileError" Relationship="ARMP.HR_MANAGEMENT_SRV.AssFileError" FromRole="FromRole_AssFileError" ToRole="ToRole_AssFileError"/>
// 			</EntityType>
// 			<EntityType Name="Error" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="Type"/>
// 					<PropertyRef Name="Id"/>
// 					<PropertyRef Name="Number"/>
// 				</Key>
// 				<Property Name="Type" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Message type" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Id" Type="Edm.String" Nullable="false" MaxLength="20" sap:unicode="false" sap:label="Message Class" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Number" Type="Edm.String" Nullable="false" MaxLength="3" sap:unicode="false" sap:label="Message Number" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Message" Type="Edm.String" Nullable="false" MaxLength="220" sap:unicode="false" sap:label="Message Text" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="LogNo" Type="Edm.String" Nullable="false" MaxLength="20" sap:unicode="false" sap:label="Log Number" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="LogMsgNo" Type="Edm.String" Nullable="false" MaxLength="6" sap:unicode="false" sap:label="Message no." sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="MessageV1" Type="Edm.String" Nullable="false" MaxLength="50" sap:unicode="false" sap:label="Message Variable" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="MessageV2" Type="Edm.String" Nullable="false" MaxLength="50" sap:unicode="false" sap:label="Message Variable" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="MessageV3" Type="Edm.String" Nullable="false" MaxLength="50" sap:unicode="false" sap:label="Message Variable" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="MessageV4" Type="Edm.String" Nullable="false" MaxLength="50" sap:unicode="false" sap:label="Message Variable" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Parameter" Type="Edm.String" Nullable="false" MaxLength="32" sap:unicode="false" sap:label="Parameter Name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Row" Type="Edm.String" Nullable="false" MaxLength="11" sap:unicode="false" sap:label="Parameter line" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Field" Type="Edm.String" Nullable="false" MaxLength="30" sap:unicode="false" sap:label="Field name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="System" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Logical system" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<EntityType Name="MatchAmei" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="Amei"/>
// 				</Key>
// 				<Property Name="Amei" Type="Edm.String" Nullable="false" MaxLength="8" sap:unicode="false" sap:label="AMEI" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="FirstName" Type="Edm.String" Nullable="false" MaxLength="25" sap:unicode="false" sap:label="First name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="LastName" Type="Edm.String" Nullable="false" MaxLength="25" sap:unicode="false" sap:label="Last name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="EmplStatus" Type="Edm.String" Nullable="false" MaxLength="20" sap:unicode="false" sap:label="Employee status" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="PersonnelArea" Type="Edm.String" Nullable="false" MaxLength="4" sap:unicode="false" sap:label="Main PA" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Vendor" Type="Edm.String" Nullable="false" MaxLength="10" sap:unicode="false" sap:label="Supplier" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Name" Type="Edm.String" Nullable="false" MaxLength="35" sap:unicode="false" sap:label="Name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="FunctionLevel" Type="Edm.String" Nullable="false" MaxLength="2" sap:unicode="false" sap:label="Function level" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<EntityType Name="EmployeeStat" sap:content-version="1">
// 				<Key>
// 					<PropertyRef Name="Sprsl"/>
// 					<PropertyRef Name="Statn"/>
// 					<PropertyRef Name="Statv"/>
// 				</Key>
// 				<Property Name="Sprsl" Type="Edm.String" Nullable="false" MaxLength="2" sap:unicode="false" sap:label="Language" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Statn" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Status number" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Statv" Type="Edm.String" Nullable="false" MaxLength="1" sap:unicode="false" sap:label="Status" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 				<Property Name="Text1" Type="Edm.String" Nullable="false" MaxLength="40" sap:unicode="false" sap:label="Name" sap:creatable="false" sap:updatable="false" sap:sortable="false" sap:filterable="false"/>
// 			</EntityType>
// 			<Association Name="AssExtEmpSupCnt" sap:content-version="1">
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.ExternalEmployee" Multiplicity="1" Role="FromRole_AssExtEmpSupCnt"/>
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.SupplierContract" Multiplicity="*" Role="ToRole_AssExtEmpSupCnt"/>
// 				<ReferentialConstraint>
// 					<Principal Role="FromRole_AssExtEmpSupCnt">
// 						<PropertyRef Name="Amei"/>
// 					</Principal>
// 					<Dependent Role="ToRole_AssExtEmpSupCnt">
// 						<PropertyRef Name="Pernr"/>
// 					</Dependent>
// 				</ReferentialConstraint>
// 			</Association>
// 			<Association Name="AssExtEmpMatchAmei" sap:content-version="1">
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.ExternalEmployee" Multiplicity="1" Role="FromRole_AssExtEmpMatchAmei"/>
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.MatchAmei" Multiplicity="*" Role="ToRole_AssExtEmpMatchAmei"/>
// 			</Association>
// 			<Association Name="AssReqError" sap:content-version="1">
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.Request" Multiplicity="1" Role="FromRole_AssReqError"/>
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.Error" Multiplicity="*" Role="ToRole_AssReqError"/>
// 				<ReferentialConstraint>
// 					<Principal Role="FromRole_AssReqError">
// 						<PropertyRef Name="RequestId"/>
// 					</Principal>
// 					<Dependent Role="ToRole_AssReqError">
// 						<PropertyRef Name="Row"/>
// 					</Dependent>
// 				</ReferentialConstraint>
// 			</Association>
// 			<Association Name="AssReqExtEmp" sap:content-version="1">
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.Request" Multiplicity="1" Role="FromRole_AssReqExtEmp"/>
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.ExternalEmployee" Multiplicity="*" Role="ToRole_AssReqExtEmp"/>
// 			</Association>
// 			<Association Name="AssFileReq" sap:content-version="1">
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.File" Multiplicity="1" Role="FromRole_AssFileReq"/>
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.Request" Multiplicity="*" Role="ToRole_AssFileReq"/>
// 			</Association>
// 			<Association Name="AssFileError" sap:content-version="1">
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.File" Multiplicity="1" Role="FromRole_AssFileError"/>
// 				<End Type="ARMP.HR_MANAGEMENT_SRV.Error" Multiplicity="*" Role="ToRole_AssFileError"/>
// 			</Association>
// 			<EntityContainer Name="ARMP_HR_MANAGEMENT_SRV_Entities" m:IsDefaultEntityContainer="true" sap:supported-formats="atom json xlsx">
// 				<EntitySet Name="ExternalEmployeeSet" EntityType="ARMP.HR_MANAGEMENT_SRV.ExternalEmployee" sap:deletable="false" sap:searchable="true" sap:content-version="1"/>
// 				<EntitySet Name="SupplierContractSet" EntityType="ARMP.HR_MANAGEMENT_SRV.SupplierContract" sap:deletable="false" sap:searchable="true" sap:content-version="1"/>
// 				<EntitySet Name="SupplierSet" EntityType="ARMP.HR_MANAGEMENT_SRV.Supplier" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:content-version="1"/>
// 				<EntitySet Name="PersonnelAreaSet" EntityType="ARMP.HR_MANAGEMENT_SRV.PersonnelArea" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:content-version="1"/>
// 				<EntitySet Name="NationalitySet" EntityType="ARMP.HR_MANAGEMENT_SRV.Nationality" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:content-version="1"/>
// 				<EntitySet Name="RequestSet" EntityType="ARMP.HR_MANAGEMENT_SRV.Request" sap:deletable="false" sap:searchable="true" sap:content-version="1"/>
// 				<EntitySet Name="FileSet" EntityType="ARMP.HR_MANAGEMENT_SRV.File" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:content-version="1"/>
// 				<EntitySet Name="ErrorSet" EntityType="ARMP.HR_MANAGEMENT_SRV.Error" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:content-version="1"/>
// 				<EntitySet Name="MatchAmeiSet" EntityType="ARMP.HR_MANAGEMENT_SRV.MatchAmei" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:content-version="1"/>
// 				<EntitySet Name="EmployeeStatSet" EntityType="ARMP.HR_MANAGEMENT_SRV.EmployeeStat" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:pageable="false" sap:addressable="false" sap:content-version="1"/>
// 				<AssociationSet Name="AssReqErrorSet" Association="ARMP.HR_MANAGEMENT_SRV.AssReqError" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:content-version="1">
// 					<End EntitySet="RequestSet" Role="FromRole_AssReqError"/>
// 					<End EntitySet="ErrorSet" Role="ToRole_AssReqError"/>
// 				</AssociationSet>
// 				<AssociationSet Name="AssExtEmpSupCntSet" Association="ARMP.HR_MANAGEMENT_SRV.AssExtEmpSupCnt" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:content-version="1">
// 					<End EntitySet="ExternalEmployeeSet" Role="FromRole_AssExtEmpSupCnt"/>
// 					<End EntitySet="SupplierContractSet" Role="ToRole_AssExtEmpSupCnt"/>
// 				</AssociationSet>
// 				<AssociationSet Name="AssExtEmpMatchAmeiSet" Association="ARMP.HR_MANAGEMENT_SRV.AssExtEmpMatchAmei" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:content-version="1">
// 					<End EntitySet="ExternalEmployeeSet" Role="FromRole_AssExtEmpMatchAmei"/>
// 					<End EntitySet="MatchAmeiSet" Role="ToRole_AssExtEmpMatchAmei"/>
// 				</AssociationSet>
// 				<AssociationSet Name="AssReqExtEmpSet" Association="ARMP.HR_MANAGEMENT_SRV.AssReqExtEmp" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:content-version="1">
// 					<End EntitySet="RequestSet" Role="FromRole_AssReqExtEmp"/>
// 					<End EntitySet="ExternalEmployeeSet" Role="ToRole_AssReqExtEmp"/>
// 				</AssociationSet>
// 				<AssociationSet Name="AssFileReqSet" Association="ARMP.HR_MANAGEMENT_SRV.AssFileReq" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:content-version="1">
// 					<End EntitySet="FileSet" Role="FromRole_AssFileReq"/>
// 					<End EntitySet="RequestSet" Role="ToRole_AssFileReq"/>
// 				</AssociationSet>
// 				<AssociationSet Name="AssFileErrorSet" Association="ARMP.HR_MANAGEMENT_SRV.AssFileError" sap:creatable="false" sap:updatable="false" sap:deletable="false" sap:content-version="1">
// 					<End EntitySet="FileSet" Role="FromRole_AssFileError"/>
// 					<End EntitySet="ErrorSet" Role="ToRole_AssFileError"/>
// 				</AssociationSet>
// 				<FunctionImport Name="getAmeiMatches" ReturnType="Collection(ARMP.HR_MANAGEMENT_SRV.ExternalEmployee)" EntitySet="ExternalEmployeeSet" m:HttpMethod="GET">
// 					<Parameter Name="FirstName" Type="Edm.String" Mode="In" MaxLength="25" sap:label="First name"/>
// 					<Parameter Name="LastName" Type="Edm.String" Mode="In" MaxLength="25" sap:label="Last name"/>
// 					<Parameter Name="BirthDate" Type="Edm.DateTime" Mode="In" Precision="7" sap:label="Birth date"/>
// 					<Parameter Name="Origin" Type="Edm.String" Mode="In" MaxLength="1" sap:label="Origin"/>
// 					<Parameter Name="PersonnelArea" Type="Edm.String" Mode="In" MaxLength="4" sap:label="Personnel Area"/>
// 				</FunctionImport>
// 				<FunctionImport Name="ProcessRequest" ReturnType="ARMP.HR_MANAGEMENT_SRV.Request" EntitySet="RequestSet" m:HttpMethod="POST">
// 					<Parameter Name="RequestId" Type="Edm.String" Mode="In" MaxLength="10" sap:label="Request ID"/>
// 				</FunctionImport>
// 				<FunctionImport Name="DownloadTemplate" ReturnType="ARMP.HR_MANAGEMENT_SRV.File" EntitySet="FileSet" m:HttpMethod="GET"/>
