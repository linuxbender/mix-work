[T4Scaffolding.Scaffolder(Description = "Test to read attributs from the model in ps and t4")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$ModelType,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)
#Write-Host $Model
$foundModelType = Get-ProjectType $ModelType -Project $Project
if (!$foundModelType) { return }
$primaryKeyName = [string](Get-PrimaryKey $foundModelType.FullName -Project $Project)

Write-Host "....................."
foreach($i in $foundModelType.Attributes) {
	Write-Host $i.Name
	Write-Host $i.Value	
}

Write-Host "....................."
foreach($i in $foundModelType.Members) {
		Write-Host $i.Name
	foreach($d in $i.Attributes){
		Write-Host $d.Name
	    Write-Host $d.Value
	}
}

Write-Host "....................."
foreach($i in $foundModelType.Collection) {
	Write-Host $i.Name
	    Write-Host $i.Value
}

#Ch.Heroku.Entities.Role
#Write-Host $foundModelType.FullName


if ($foundModelType) { $relatedEntities = [Array](Get-RelatedEntities $foundModelType.FullName -Project $project) }
if (!$relatedEntities) { $relatedEntities = @() }

$outputPath = Join-Path Output Demo
$namespace = (Get-Project $Project).Properties.Item("DefaultNamespace").Value

Add-ProjectItemViaTemplate $outputPath -Template HerokuTemplate `
	-Model @{ 
	Namespace = $namespace;
	ViewDataType = [MarshalByRefObject]$foundModelType;
	ViewDataTypeName = $foundModelType.Name;
	} `
	-SuccessMessage "Added Heroku output at {0}" `
	-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force