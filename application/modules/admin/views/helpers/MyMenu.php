<?php

/**
 * Description of MyMenu
 *
 * @author Egiw
 */
class Admin_View_Helper_MyMenu extends Zend_View_Helper_Navigation_Menu {

    public function myMenu(Zend_Navigation_Container $container = null) {
        return parent::menu($container);
    }

    protected function _renderMenu(\Zend_Navigation_Container $container, $ulClass, $indent, $minDepth, $maxDepth, $onlyActive, $expandSibs, $ulId) {
        $html = '';

        // find deepest active
        if ($found = $this->findActive($container, $minDepth, $maxDepth)) {
            $foundPage = $found['page'];
            $foundDepth = $found['depth'];
        } else {
            $foundPage = null;
        }

        // create iterator
        $iterator = new RecursiveIteratorIterator($container, RecursiveIteratorIterator::SELF_FIRST);
        if (is_int($maxDepth)) {
            $iterator->setMaxDepth($maxDepth);
        }

        // iterate container
        $prevDepth = -1;
        foreach ($iterator as $page) {
            $depth = $iterator->getDepth();
            $isActive = $page->isActive(true);
            if ($depth < $minDepth || !$this->accept($page)) {
                // page is below minDepth or not accepted by acl/visibilty
                continue;
            } else if ($expandSibs && $depth > $minDepth) {
                // page is not active itself, but might be in the active branch
                $accept = false;
                if ($foundPage) {
                    if ($foundPage->hasPage($page)) {
                        // accept if page is a direct child of the active page
                        $accept = true;
                    } else if ($page->getParent()->isActive(true)) {
                        // page is a sibling of the active branch...
                        $accept = true;
                    }
                }
                if (!$isActive && !$accept) {
                    continue;
                }
            } else if ($onlyActive && !$isActive) {
                // page is not active itself, but might be in the active branch
                $accept = false;
                if ($foundPage) {
                    if ($foundPage->hasPage($page)) {
                        // accept if page is a direct child of the active page
                        $accept = true;
                    } else if ($foundPage->getParent()->hasPage($page)) {
                        // page is a sibling of the active page...
                        if (!$foundPage->hasPages() ||
                        is_int($maxDepth) && $foundDepth + 1 > $maxDepth) {
                            // accept if active page has no children, or the
                            // children are too deep to be rendered
                            $accept = true;
                        }
                    }
                }

                if (!$accept) {
                    continue;
                }
            }

            // make sure indentation is correct
            $depth -= $minDepth;
            $myIndent = $indent . str_repeat('        ', $depth);

            if ($depth > $prevDepth) {
                $attribs = array();

                // start new ul tag
                if ($depth > 0) {
                    $attribs = array(
                        'class' => 'nav nav-list',
                        'id'    => $ulId,
                    );
                }

                // We don't need a prefix for the menu ID (backup)
                $skipValue = $this->_skipPrefixForId;
                $this->skipPrefixForId();

                if ($depth > 0) {
                    $parentId = $page->getParent()->getHref();
                    $active = ($page->getParent()->isActive(true)) ? 'in' : '';
                    $html .= '<div class="accordion-body '
                    . $active . ' collapse" id="' . str_replace('#', '', $parentId)
                    . '">' . self::EOL
                    . '<div class="accordion-inner">' . self::EOL
                    . $myIndent . '<ul'
                    . $this->_htmlAttribs($attribs)
                    . '>'
                    . self::EOL;
                }

                // Reset prefix for IDs
                $this->_skipPrefixForId = $skipValue;
            } else if ($prevDepth > $depth) {
                // close li/ul tags until we're at current depth
                for ($i = $prevDepth; $i > $depth; $i--) {
                    $ind = $indent . str_repeat('        ', $i);
                    $html .= $ind . '    </li>' . self::EOL;
                    $html .= $ind . '</ul></div></div>' . self::EOL;
                }
                // close previous li tag
                $html .= $myIndent . '    </div>' . self::EOL;
            } else {
                // close previous li tag
                $html .= $myIndent . '    </li>' . self::EOL;
            }

            // render li tag and page
            $liClass = $isActive ? ' class="active"' : '';
            if ($depth == 0) {
                $page->setClass('accordion-toggle');
                $page->setCustomHtmlAttribs(array(
                    'data-parent' => '#side_accordion',
                    'data-toggle' => 'collapse'
                ));
                $html .= $myIndent . '    <div class="accordion-group">' . self::EOL
                . $myIndent . '        ' . '<div class="accordion-heading">' . self::EOL
                . $myIndent . '        ' . $this->htmlify($page) . self::EOL
                . $myIndent . '        ' . '</div>' . self::EOL;
            } else {
                $html .= $myIndent . '    <li' . $liClass . '>' . self::EOL
                . $myIndent . '        ' . $this->htmlify($page) . self::EOL;
            }

            // store as previous depth for next iteration
            $prevDepth = $depth;
        }

        if ($html) {
            // done iterating container; close open ul/li tags
            for ($i = $prevDepth + 1; $i > 0; $i--) {
                $myIndent = $indent . str_repeat('        ', $i - 1);
                if (0 == $i - 1) {
                    $html .= $myIndent . '    </div>' . self::EOL;
                } else {
                    $html .= $myIndent . '    </li>' . self::EOL;
                };
                if (0 != $i - 1) $html .= $myIndent . '</ul></div></div>' . self::EOL;
            }
            $html = rtrim($html, self::EOL);
        }

        return $html;
    }

}