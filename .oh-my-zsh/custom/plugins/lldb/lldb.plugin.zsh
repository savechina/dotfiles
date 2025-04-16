# 动态获取 clang 和 lldb-dap 的路径，并将其添加到 PATH 环境变量中
function add_clang_lldb_dap_to_path() {
    # 获取 clang 和 lldb-dap 的 bin 目录路径
    local CLANG_BIN_DIR=$(xcrun -f clang | xargs dirname)
    local LLDB_DAP_BIN_DIR=$(xcrun -f lldb-dap | xargs dirname)

    # 检查目录是否存在，避免添加不存在的路径
    if [ -d "$CLANG_BIN_DIR" ]; then
        export PATH="$CLANG_BIN_DIR:$PATH"
    fi

    if [ -d "$LLDB_DAP_BIN_DIR" ]; then
        export PATH="$LLDB_DAP_BIN_DIR:$PATH"
    fi
}

# 在每次启动 Zsh 时调用该函数
add_clang_lldb_dap_to_path
