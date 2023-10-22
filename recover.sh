
PROJECT_DIR="/"


NPM_EXECUTABLE="docker"


COMMAND="start incident-server"

# 프로젝트 디렉토리로 이동합니다.
cd $PROJECT_DIR

# 8080번 포트를 사용 중인 프로세스 ID를 찾습니다.
PORT=8080
PID=$(lsof -ti tcp:$PORT)

# 8080번 포트를 사용 중인 프로세스가 있는지 확인합니다.
if [ -z "$PID" ]; then
  echo "8080번 포트를 사용 중인 프로세스가 없습니다."
else
  # 프로세스를 종료합니다.
  kill -9 $PID
  echo "포트 $PORT를 사용 중인 프로세스를 종료했습니다."
fi

# npm 명령어를 실행합니다.
$NPM_EXECUTABLE $COMMAND
