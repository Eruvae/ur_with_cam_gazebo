declare -A options

# Define default options
options[joint_limit_params]=../config/common/joint_limits.yaml
options[kinematics_params]=../config/common/default_kinematics.yaml
options[physical_params]=../config/common/physical_parameters.yaml
options[visual_params]=../config/common/visual_parameters.yaml
options[transmission_hw_interface]=hardware_interface/PositionJointInterface
options[safety_limits]=false
options[safety_pos_margin]=0.15
options[safety_k_position]=20
options[base]=static
options[camera]=l515

# Read additional / override default options
while (( "$#" )); do
  key=${1%:=*}
  val=${1#*:=}
  options[$key]=$val
  shift;
done

opt_str=""

for opt in "${!options[@]}";
do
  opt_str="$opt_str $opt:=${options[$opt]}";
done

xacro -o ur_with_cam.urdf ur_with_cam.xacro $opt_str
