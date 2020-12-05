MAKEFLAGS+="--silent"

.PHONY: upload-csv sql-init

subscription?="<<TODO: enter subscription here>>"
uploadAccount?="ldatafactorypocsa"
sqlServerHost?="ldatafactorypocsa"
vault?="ldatafactorypocsa"

define showKeyVaultSecret
$(shell az keyvault secret show \
	--subscription ${subscription} \
	-n $1 \
	--vault-name ${vault} \
	| jq -rc '.value')
endef

define getAdminLogin
$(call showKeyVaultSecret,admin-login)
endef

define getAdminPassword
$(call showKeyVaultSecret,admin-password)
endef

sql-init:
	docker run -it \
		-v $$PWD/sql:/tmp/sql \
		mcr.microsoft.com/mssql-tools \
		bash -c "/opt/mssql-tools/bin/sqlcmd \
			-S ${sqlServerHost}.database.windows.net \
			-U \"$(call getAdminLogin)\" \
			-P \"$(call getAdminPassword)\" \
			-d upload \
			-i /tmp/sql/init.sql"

upload-csv:
	az storage copy \
		--subscription ${subscription} \
		-s "data/*" \
		-r \
		--destination-account-name ${uploadAccount} \
		--destination-container upload
