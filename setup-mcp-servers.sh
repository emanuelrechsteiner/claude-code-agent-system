#!/bin/bash

# Claude Code Multi-Agent System - Comprehensive MCP Server Setup
# This script configures all 7 MCP servers to match the working Dimension 2 configuration

set -e  # Exit on error

echo "🚀 Claude Code Multi-Agent System - MCP Server Configuration"
echo "============================================================="
echo ""
echo "This script will configure all MCP servers for optimal agent performance:"
echo "  • filesystem - File system access"
echo "  • github - GitHub integration" 
echo "  • memory - Knowledge graph memory"
echo "  • everything - Testing/demo server"
echo "  • puppeteer - Browser automation"
echo "  • firecrawl - Web scraping (requires API key)"
echo "  • vector-db - Your local documentation database"
echo ""

# Function to prompt user for input
prompt_user() {
    local prompt_text="$1"
    local default_value="$2"
    local response
    
    if [ -n "$default_value" ]; then
        echo -n "$prompt_text [$default_value]: "
    else
        echo -n "$prompt_text: "
    fi
    
    read -r response
    echo "${response:-$default_value}"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to find vector database MCP server script
find_vector_server_script() {
    local possible_locations=(
        "/Volumes/*/Development/Claude_Code/claude-complete-ecosystem/mcp-vector-server.py"
        "$HOME/Development/*/mcp-vector-server.py" 
        "$(pwd)/mcp-vector-server.py"
        "$(find /Volumes -name "mcp-vector-server.py" 2>/dev/null | head -1)"
    )
    
    for location in "${possible_locations[@]}"; do
        # Handle wildcard expansions
        for expanded_path in $location; do
            if [ -f "$expanded_path" ]; then
                echo "$expanded_path"
                return 0
            fi
        done
    done
    
    return 1
}

# Function to detect existing vector databases
detect_vector_databases() {
    echo "🔍 Searching for existing vector databases..."
    
    local found_databases=()
    
    # Search common locations
    local search_paths=(
        "/Volumes/*/VectorDatabase/*"
        "/Volumes/*/Development/*/VectorDB*"
        "$HOME/VectorDatabase/*"
        "$HOME/Development/*/VectorDB*"
    )
    
    for search_path in "${search_paths[@]}"; do
        for path in $search_path; do
            if [ -d "$path" ] && ([ -f "$path/vector_db_index.json" ] || [ -f "$path/processing_summary.json" ]); then
                found_databases+=("$path")
            fi
        done
    done
    
    if [ ${#found_databases[@]} -gt 0 ]; then
        echo "📊 Found ${#found_databases[@]} potential vector database(s):"
        for i in "${!found_databases[@]}"; do
            local db_path="${found_databases[$i]}"
            local doc_count="Unknown"
            
            if [ -d "$db_path/cleaned" ]; then
                doc_count=$(find "$db_path/cleaned" -type f | wc -l)
            fi
            
            echo "  $((i+1)). $db_path ($doc_count documents)"
        done
        echo ""
        
        return 0
    else
        echo "❌ No existing vector databases found"
        return 1
    fi
}

echo "🔍 Checking prerequisites..."
echo ""

# Check if Claude Code is installed
if ! command_exists claude; then
    echo "❌ Error: Claude Code CLI not found!"
    echo "Please install Claude Code first: https://claude.ai/code"
    exit 1
fi

# Check if Node.js is available for NPM packages
if ! command_exists npx; then
    echo "❌ Error: npx not found! Node.js is required for MCP servers."
    echo "Please install Node.js: https://nodejs.org"
    exit 1
fi

# Check if Python is available for vector database
if ! command_exists python3; then
    echo "❌ Error: python3 not found! Python is required for vector database server."
    echo "Please install Python 3.7+: https://python.org"
    exit 1
fi

echo "✅ All prerequisites found!"
echo ""

# ============================================================================
# STEP 1: Configure Core MCP Servers (no user input required)
# ============================================================================

echo "📦 Configuring core MCP servers (automatic)..."
echo ""

# Remove any existing conflicting servers first
echo "🔄 Cleaning up any existing server configurations..."
claude mcp remove filesystem -s user 2>/dev/null || true
claude mcp remove github -s user 2>/dev/null || true
claude mcp remove memory -s user 2>/dev/null || true
claude mcp remove everything -s user 2>/dev/null || true
claude mcp remove puppeteer -s user 2>/dev/null || true

echo ""

# Configure filesystem server
echo "Setting up filesystem server..."
claude mcp add filesystem -s user -- npx @modelcontextprotocol/server-filesystem "$HOME"
if [ $? -eq 0 ]; then
    echo "  ✅ filesystem server configured"
else
    echo "  ❌ Failed to configure filesystem server"
fi

# Configure github server  
echo "Setting up github server..."
claude mcp add github -s user -- npx @modelcontextprotocol/server-github
if [ $? -eq 0 ]; then
    echo "  ✅ github server configured"
else
    echo "  ❌ Failed to configure github server"
fi

# Configure memory server
echo "Setting up memory server..."
claude mcp add memory -s user -- npx @modelcontextprotocol/server-memory
if [ $? -eq 0 ]; then
    echo "  ✅ memory server configured"
else
    echo "  ❌ Failed to configure memory server"
fi

# Configure everything server
echo "Setting up everything server..."
claude mcp add everything -s user -- npx @modelcontextprotocol/server-everything
if [ $? -eq 0 ]; then
    echo "  ✅ everything server configured"
else
    echo "  ❌ Failed to configure everything server"
fi

# Configure puppeteer server
echo "Setting up puppeteer server..."
claude mcp add puppeteer -s user -- npx @modelcontextprotocol/server-puppeteer
if [ $? -eq 0 ]; then
    echo "  ✅ puppeteer server configured"
else
    echo "  ❌ Failed to configure puppeteer server"
fi

echo ""
echo "✅ Core MCP servers configured successfully!"
echo ""

# ============================================================================
# STEP 2: Configure Firecrawl MCP Server (requires API key)
# ============================================================================

echo "🔧 Configuring Firecrawl MCP Server..."
echo ""
echo "Firecrawl provides web scraping capabilities for the research agent."
echo "You need a Firecrawl API key to use this service."
echo ""

# Check if user wants to configure Firecrawl
echo "Do you want to configure Firecrawl now? (y/n)"
read -r configure_firecrawl

if [[ "$configure_firecrawl" =~ ^[Yy]$ ]]; then
    echo ""
    echo "📋 To get your Firecrawl API key:"
    echo "  1. Go to: https://firecrawl.dev"
    echo "  2. Sign up for an account"
    echo "  3. Get your API key (format: fc-xxxxxxxxxxxxxxxxxxxxxxxxxx)"
    echo ""
    
    firecrawl_key=$(prompt_user "Enter your Firecrawl API key")
    
    if [ -n "$firecrawl_key" ] && [[ $firecrawl_key =~ ^fc- ]]; then
        # Remove existing firecrawl server
        claude mcp remove firecrawl -s user 2>/dev/null || true
        
        # Add firecrawl server
        echo "Setting up Firecrawl server..."
        claude mcp add firecrawl -s user -e "FIRECRAWL_API_KEY=$firecrawl_key" -- npx -y firecrawl-mcp
        
        if [ $? -eq 0 ]; then
            echo "  ✅ Firecrawl server configured successfully!"
            
            # Store API key in .env for future reference
            if [ -f ".env" ]; then
                # Update existing .env
                sed -i.bak "s/firecrawl-api-key=.*/firecrawl-api-key=$firecrawl_key/" .env
            else
                # Create new .env from template
                if [ -f "example.env" ]; then
                    cp example.env .env
                    sed -i.bak "s/firecrawl-api-key=.*/firecrawl-api-key=$firecrawl_key/" .env
                else
                    echo "firecrawl-api-key=$firecrawl_key" > .env
                fi
            fi
            echo "  📁 API key saved to .env file"
        else
            echo "  ❌ Failed to configure Firecrawl server"
        fi
    else
        echo "❌ Invalid API key format. Skipping Firecrawl configuration."
        echo "You can configure it later by running: ./setup-firecrawl-mcp.sh"
    fi
else
    echo "⏭️  Skipping Firecrawl configuration."
    echo "You can configure it later by running: ./setup-firecrawl-mcp.sh"
fi

echo ""

# ============================================================================
# STEP 3: Configure Vector Database MCP Server (requires path)
# ============================================================================

echo "🗂️  Configuring Vector Database MCP Server..."
echo ""
echo "The vector database provides semantic search across your technical documentation."
echo "This powers the research agent's ability to find relevant information quickly."
echo ""

# Check if user has existing vector database
echo "Do you have an existing vector database? (y/n)"
read -r has_existing_db

if [[ "$has_existing_db" =~ ^[Yy]$ ]]; then
    echo ""
    
    # Try to auto-detect vector databases first
    if detect_vector_databases; then
        echo "Which vector database would you like to use?"
        read -r db_choice
        
        # Validate choice and get path
        if [[ "$db_choice" =~ ^[0-9]+$ ]]; then
            local found_databases=()
            for search_path in "/Volumes/*/VectorDatabase/*" "/Volumes/*/Development/*/VectorDB*" "$HOME/VectorDatabase/*" "$HOME/Development/*/VectorDB*"; do
                for path in $search_path; do
                    if [ -d "$path" ] && ([ -f "$path/vector_db_index.json" ] || [ -f "$path/processing_summary.json" ]); then
                        found_databases+=("$path")
                    fi
                done
            done
            
            if [ "$db_choice" -ge 1 ] && [ "$db_choice" -le ${#found_databases[@]} ]; then
                vector_db_path="${found_databases[$((db_choice-1))]}"
                echo "✅ Selected: $vector_db_path"
            else
                echo "❌ Invalid choice. Please enter a number between 1 and ${#found_databases[@]}"
                vector_db_path=$(prompt_user "Enter the full path to your vector database")
            fi
        fi
    else
        # Manual entry if auto-detection fails
        echo "📂 Please provide the path to your vector database directory."
        echo "This should be a directory containing files like:"
        echo "  • vector_db_index.json"
        echo "  • processing_summary.json" 
        echo "  • cleaned/ directory"
        echo "  • chunks/ directory"
        echo ""
        
        vector_db_path=$(prompt_user "Enter the full path to your vector database")
    fi
    
    if [ -d "$vector_db_path" ]; then
        # Validate that it looks like a vector database
        if [ -f "$vector_db_path/vector_db_index.json" ] || [ -f "$vector_db_path/processing_summary.json" ]; then
            echo "✅ Vector database directory validated!"
            
            # Find the vector server script
            vector_server_script=$(find_vector_server_script)
            
            if [ -z "$vector_server_script" ]; then
                echo "❓ Vector database server script not found in common locations."
                vector_server_script=$(prompt_user "Enter the full path to mcp-vector-server.py")
            else
                echo "📍 Found vector server script: $vector_server_script"
            fi
            
            if [ -f "$vector_server_script" ]; then
                # Remove existing vector-db server
                claude mcp remove vector-db -s user 2>/dev/null || true
                
                # Add vector database server
                echo "Setting up vector database server..."
                claude mcp add vector-db -s user -e "VECTOR_DB_PATH=$vector_db_path" -- python3 "$vector_server_script"
                
                if [ $? -eq 0 ]; then
                    echo "  ✅ Vector database server configured successfully!"
                    echo "  📊 Database contains: $(ls -1 "$vector_db_path/cleaned" 2>/dev/null | wc -l) documents"
                    
                    # Store configuration for future reference
                    echo "VECTOR_DB_PATH=$vector_db_path" >> .env 2>/dev/null || true
                    echo "VECTOR_SERVER_SCRIPT=$vector_server_script" >> .env 2>/dev/null || true
                else
                    echo "  ❌ Failed to configure vector database server"
                fi
            else
                echo "❌ Vector server script not found. Skipping vector database configuration."
            fi
        else
            echo "❌ Directory doesn't appear to contain a valid vector database."
            echo "Missing required files: vector_db_index.json or processing_summary.json"
        fi
    else
        echo "❌ Directory not found: $vector_db_path"
    fi
else
    echo ""
    echo "📥 No existing vector database found."
    echo ""
    echo "Would you like to set up a sample vector database for testing? (y/n)"
    read -r setup_sample_db
    
    if [[ "$setup_sample_db" =~ ^[Yy]$ ]]; then
        echo ""
        echo "🚧 Sample vector database setup is not yet implemented."
        echo "For now, you can:"
        echo "  1. Create your own vector database using your preferred tools"
        echo "  2. Re-run this script when you have a vector database ready"
        echo "  3. Manually configure the vector-db MCP server later"
        echo ""
        echo "The system will work without vector database - you'll just miss semantic search capabilities."
    else
        echo "⏭️  Skipping vector database configuration."
        echo "You can configure it later by re-running this script."
    fi
fi

echo ""

# ============================================================================
# STEP 4: Validation and Summary
# ============================================================================

echo "🔍 Validating MCP server configuration..."
echo ""

# Check server health
echo "Checking MCP server connections..."
claude mcp list

echo ""
echo "🎉 MCP Server Configuration Complete!"
echo ""
echo "📊 Configuration Summary:"
echo "========================="

# Count configured servers
server_count=$(claude mcp list | grep -c "✓ Connected" || echo "0")
echo "📈 Total servers configured: $server_count"

echo ""
echo "🚀 Next Steps:"
echo "=============="
echo "1. Restart Claude Code to ensure all servers are loaded"
echo "2. Test agent functionality with a prompt like:"
echo "   'Research the latest React documentation'"
echo "3. The agents will automatically use these MCP servers"
echo ""

if [ -f ".env" ]; then
    echo "🔒 Security:"
    echo "   • Your API keys are stored in .env file (gitignored)"
    echo "   • Never commit .env to version control"
    echo ""
fi

echo "📚 For troubleshooting:"
echo "   • Check server status: claude mcp list"
echo "   • View server details: claude mcp get <server-name>"
echo "   • Remove server: claude mcp remove <server-name> -s user"
echo ""
echo "✅ Your Claude Code Multi-Agent System is ready!"