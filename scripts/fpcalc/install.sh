script_dir="$(cd $(dirname "${BASH_SOURCE[0]}") || exit; pwd)"
mkdir -p "$TOOLS_PATH"
# 将tools目录添加进PATH
echo "$(cd "$TOOLS_PATH" || exit; pwd)" >> $GITHUB_PATH
# 安装python依赖
if [[ -f $script_dir/requirements.txt ]]; then pip install -r $script_dir/requirements.txt; fi

ffmpeg_url="https://github.com/Nomeqc/my-release/releases/download/ffmpeg/ffmpeg"
ffprobe_url="https://github.com/Nomeqc/my-release/releases/download/ffmpeg/ffprobe"
fpcalc_url="https://github.com/nomeqc/my-release/releases/download/fpcalc/fpcalc"
# 下载ffmpeg
if [[ "$TOOLS_CACHE_HIT" != "true" ]]; then
    echo "下载：$ffmpeg_url"
    curl -# -Lfo "$TOOLS_PATH/ffmpeg" "$ffmpeg_url"
    echo "下载：$ffprobe_url"
    curl -# -Lfo "$TOOLS_PATH/ffprobe" "$ffprobe_url"
    echo "下载：$fpcalc_url"
    curl -# -Lfo "$TOOLS_PATH/fpcalc" "$fpcalc_url"
    chmod a+rx "$TOOLS_PATH/ffmpeg"
    chmod a+rx "$TOOLS_PATH/ffprobe"
    chmod a+rx "$TOOLS_PATH/fpcalc"
fi
