connection: "workshop_teste"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: portfolio_projetos_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

#persist_with: portfolio_projetos_default_datagroup


explore: vw_dim_squad {
  label: "SQUAD"
  join: vw_dim_projeto {
    relationship: many_to_one
    sql_on: ${vw_dim_squad.id} = ${vw_dim_projeto.id_squad} ;;
 }

  join: adasds {
    relationship: many_to_one
    sql_on: ${vw_dim_squad.id} = ${adasds.squad_id} ;;
  }

}
