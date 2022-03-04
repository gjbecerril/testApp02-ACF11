component output="false" {

	remote any function getDateTime() returnFormat="JSON" {
		return SerializeJSON(now());
	}

	remote any function getPlayers(string dob="") returnFormat="JSON" {
		
		var local = structNew();

	  	var playersQry = queryNew("id,fullname,height,weight,hometown,major,dob,coachname",
									"integer,varchar,decimal, decimal,varchar,varchar,timestamp,varchar", 
			[ 
				{id=1,fullname="John Smith",height=6.0, weight=180, homeTown="San Diego", major="Computer Science", dob=CreateDateTime(2005,1,2,0,0,0), coachname="Pep Guardiola"}, 
				{id=2,fullname="Payton Henderson",height=6.5, weight=190, homeTown="San Francisco", major="Biology", dob=CreateDateTime(1978,2,1,0,0,0), coachname="Pep Guardiola"}, 
				{id=3,fullname="Kelsey Barry",height=6.1, weight=120, homeTown="San Jose", major="Criminal Justice", dob=CreateDateTime(1970,2,1,0,0,0), coachname="Pep Guardiola"}, 
				{id=4,fullname="Taryn Soto",height=6.0, weight=200, homeTown="San Clemente", major="Chemisytry", dob=CreateDateTime(1981,2,1,0,0,0), coachname="Pep Guardiola"}, 
				{id=5,fullname="Cameron Bautista",height=5.9, weight=150, homeTown="San Antonio", major="Mechanical Engineering", dob=CreateDateTime(1985,2,1,0,0,0), coachname="Pep Guardiola"}, 
				{id=6,fullname="Cooper Mccray",height=6.0, weight=180, homeTown="San Andres", major="Computer Science", dob=CreateDateTime(2000,2,1,0,0,0), coachname="Pep Guardiola"}, 
				{id=7,fullname="Roxie Romero",height=5.5, weight=130, homeTown="San Bernardino", major="Accounting", dob=CreateDateTime(1999,2,1,0,0,0), coachname="Jurgen Klopp"}, 
				{id=8,fullname="Emily-Jane Stevens",height=6.0, weight=110, homeTown="San Jacinto", major="Economics", dob=CreateDateTime(2001,2,1,0,0,0), coachname="Ralf Rangnick"}, 
				{id=9,fullname="Shauna Rangel",height=5.2, weight=110, homeTown="San Tolomeo", major="Industrial Engineering", dob=CreateDateTime(1980,2,1,0,0,0), coachname="Pep Guardiola"}, 
				{id=10,fullname="Liana Mcnamara",height=5.9, weight=120, homeTown="San Tomas", major="Liberal Arts", dob=CreateDateTime(1981,2,1,0,0,0), coachname="Pep Guardiola"}
			]);

			if(isDate(arguments.dob)){
				local.queryObj = new Query(
					sql="select 
							id,fullname,height,weight,hometown,major,dob,coachname
						FROM 
							playersQry
						WHERE
							dob > :dob", 
					dbtype="query", 
					playersQry = playersQry);
				local.queryObj.addParam(name="dob",value=arguments.dob, cfsqltype="cf_sql_timestamp");
				playersQry = local.queryObj.execute().getResult();
			}

		local.data.success = true;
		local.data.qry = "";
		if (playersQry.recordCount){
			local.data.qry = SerializeJSON(playersQry, "struct");	
		}
		else {
			local.data.success = false;
		}	
		return local.data;
	}

}