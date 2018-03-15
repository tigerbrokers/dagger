#/bin/sh

pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}"
if ([ -h "${SCRIPT_PATH}" ]); then
  while([ -h "${SCRIPT_PATH}" ]); do cd `dirname "$SCRIPT_PATH"`;
  SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;

# 16位secret，在运维发的二维码链接里面找
secret=$DAGGER_GAUTH_SECRET

# 获得google authenticator token, token只能使用一次, 30秒更新一次
code=`python ./google_token.py $secret`

# 跳板机用户名SSH
ssh_login=$DAGGER_SSH_LOGIN

password=$DAGGER_SSH_PASSWORD

# 自动登录
expect ./login_pro.exp $ssh_login $code "$password"

popd  > /dev/null
