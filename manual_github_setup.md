#!/bin/bash

# 手动创建GitHub仓库的指导脚本
echo "🚀 GitHub仓库手动创建指导"
echo "=============================="
echo

echo "请按照以下步骤手动创建GitHub仓库："
echo
echo "1. 打开GitHub并登录：https://github.com"
echo "2. 点击右上角的 '+' 号，选择 'New repository'"
echo "3. 填写以下信息："
echo "   • Repository name: english-vocabulary-learning"
echo "   • Description: English vocabulary learning with interactive cards and daily exercises"
echo "   • Public: ✅ (Public)"
echo "   • Add a README file: ❌ (不要勾选)"
echo "4. 点击 'Create repository' 按钮"
echo
echo "4. 创建成功后，在仓库页面上点击 'SSH' 或 'HTTPS' 标签，复制仓库地址："
echo "   https://github.com/huyg0415/english-vocabulary-learning.git"
echo
echo "5. 然后运行以下命令完成配置："
echo
echo "cd /Users/huyg-macmini/.openclaw/workspace"
echo "git remote set-url origin https://github.com/huyg0415/english-vocabulary-learning.git"
echo "git push -u origin main"
echo
echo "完成后，您的仓库就设置好了！"
echo
echo "🎯 GitHub Pages设置："
echo "1. 访问：https://github.com/huyg0415/english-vocabulary-learning"
echo "2. 点击 'Settings' 标签"
echo "3. 滚动到 'GitHub Pages' 部分"
echo "4. 选择 'Deploy from a branch' → 'main' → '/'"
echo "5. 点击 'Save'"
echo "6. 几分钟后访问：https://huyg0415.github.io/english-vocabulary-learning/"