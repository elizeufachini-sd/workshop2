connection: "workshop_teste"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: vw_dim_squad {
  join: vw_dim_projeto {
    relationship: many_to_one
    sql_on: ${vw_dim_squad.id} = ${vw_dim_projeto.id_squad} ;;
 }

  # join: users {
  #   relationship: many_to_one
  #   sql_on: ${users.id} = ${orders.user_id} ;;
  # }
}