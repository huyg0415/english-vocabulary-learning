#!/bin/bash

# 完整的GitHub仓库创建和推送脚本
echo "🚀 GitHub仓库设置脚本"
echo "======================"
echo

# 询问用户是否已创建GitHub仓库
read -p "您是否已在GitHub上创建了 'english-vocabulary-learning' 仓库？(y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "✅ 检测到GitHub仓库已创建，开始推送..."
    git remote set-url origin https://github.com/huyg0415/english-vocabulary-learning.git
    git push -u origin main
    if [ $? -eq 0 ]; then
        echo "🎉 推送成功！"
        echo "📱 访问您的GitHub Pages: https://huyg0415.github.io/english-vocabulary-learning/"
        echo "📋 记得在GitHub设置中启用GitHub Pages！"
    else
        echo "❌ 推送失败，请检查网络连接和GitHub仓库状态"
    fi
else
    echo "📝 请先在GitHub上创建仓库，然后重新运行此脚本"
    echo "创建仓库步骤："
    echo "1. 访问：https://github.com/new"
    echo "2. 仓库名：english-vocabulary-learning"
    echo "3. 描述：English vocabulary learning with interactive cards and daily exercises"
    echo "4. 选择Public"
    echo "5. 不要初始化README"
    echo "6. 点击Create repository"
    echo "7. 创建完成后重新运行此脚本"
fi